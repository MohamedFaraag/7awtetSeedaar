import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/language/suportlanguage.dart';
import 'package:mlahem/main.dart';

class LanguageScreen extends StatefulWidget {
  static String routeName = '/laneguae';

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocal(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ktext2color),
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                getTranslated(context, 'changeLang'),
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenWidth(24),
                ),
              ),
            ),
            Column(
              children: Language.languageList()
                  .map((e) => Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () => _changeLanguage(e),
                          child: Text(
                            e.name,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.green),
                          ),
                        ),
                      ))
                  .toList(),
            )

            // DropdownButton(
            //   onChanged: (Lang language) {
            //     _changeLanugage(language);
            //   },
            //   icon: Icon(
            //     Icons.language,
            //     size: 40,
            //   ),
            //   items:
            // ),
          ],
        ),
      ),
    );
  }

  // ..._getBody()
  // _getBody() {
  //   return Language.languageList().map(
  //     (e) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Container(
  //           child: GestureDetector(
  //             onTap: () => _changeLanguage(e),
  //             child: Text(
  //               e.name,
  //               style: TextStyle(
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //                 fontSize: 24,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
