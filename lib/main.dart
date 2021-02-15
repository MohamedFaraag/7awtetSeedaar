import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mlahem/Screens/splashScreen.dart';

import 'package:mlahem/configrations/routes.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Demo_localization.dart';
import 'package:mlahem/language/Local_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocal(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocal(locale);
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocal(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ملاحم حوطة سدير',
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kheadlinecolor),
        ),
      ),
      locale: _locale,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      localizationsDelegates: [
        DemoLocalization.delegate,
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      initialRoute: SplScreen.routeName,
      routes: routes,
    );
  }
}
