import 'package:flutter/material.dart';
import 'package:mlahem/Screens/ClientScreen.dart';
import 'package:mlahem/Screens/ClientScreen2.dart';
import 'package:mlahem/language/suportlanguage.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/main.dart';
import 'package:mlahem/widgets/customTapBar2.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String _role;
String _token;
// String massage = '';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homescreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getToken();
    super.initState();
  }
  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  // Future getRole() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _role = prefs.getString('role');
  //     _token = prefs.getString('token');
  //     print(_role);
  //     print(_token);
  //   });
  // }
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    // switch (language.languageCode) {
    //   case 'en':
    //     _temp = Locale(language.languageCode, 'US');
    //     break;
    //   case 'ar':
    //     _temp = Locale(language.languageCode, 'EG');
    //     break;
    //   default:
    //     _temp = Locale(ENGLISH, 'US');
    // }
    MyApp.setLocal(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    // if (_role == null) {
    //   getRole();
    // } else {
    //   print(_role);
    //   print(_token);
    // }

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: DropdownButton(
                onChanged: (Language language) {
                  _changeLanguage(language);
                },
                underline: SizedBox(),
                icon: Icon(Icons.language, color: Colors.green),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          children: [
                            Text(
                              lang.name,
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ),
        ],
        iconTheme: IconThemeData(color: ktext2color),
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(200),
          ),
          Center(
            child: Container(
              height: getProportionateScreenHeight(150),
              child: Image.asset('assets/images/logomalahem@2x.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                  bottomLeft: Radius.circular(55),
                  bottomRight: Radius.circular(55),
                ),
                child: Container(
                  height: getProportionateScreenHeight(90),
                  width: getProportionateScreenWidth(100),
                  child: RaisedButton(
                    onPressed: () {
                      print('Client');
                      // _role != 'admin'
                      // ?
                      Navigator.pushNamed(context, ClientScreen.routeName);
                      // : massage = 'U cannot Go to Pannal';
                    },
                    child: Text(
                      getTranslated(context, 'scondTitle'),
                      style: TextStyle(
                        color: ktextbuttoncolor,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    color: ktext2color,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                  bottomLeft: Radius.circular(55),
                  bottomRight: Radius.circular(55),
                ),
                child: Container(
                  height: getProportionateScreenHeight(90),
                  width: getProportionateScreenWidth(100),
                  child: RaisedButton(
                    onPressed: () {
                      print('Admin');
                      // _token == null
                      //    ?
                      print(_token);
                      _token == null
                          ? Navigator.pushNamed(context, LoginScreen.routeName)
                          : Navigator.pushNamed(context, MainTapbarr2.routeName);
                      // : _role == 'admin'
                      // ? Navigator.pushReplacementNamed(
                      //     context, ClientScreen2.routeName)
                      //  : massage = 'Please Check your Account';
                    },
                    child: Text(
                      getTranslated(context, 'mainTitle'.toString()),
                      style: TextStyle(
                        color: ktextbuttoncolor,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    color: ktext2color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
          Text(
            getTranslated(context, 'fis'),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(17),
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
        ],
      ),
    );
  }

  // _getrole() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _role = prefs.getString('role');
  //   });
  //   print(_role);
  // }
}
