import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/setting/aboutappScreen.dart';
import 'package:mlahem/setting/changeLangScreen.dart';
import 'package:mlahem/setting/condtionScreen.dart';
import 'package:mlahem/setting/mailScreen.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = '/settingsScreen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _token;
  @override
  void initState() {
    _getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(padding: EdgeInsets.all(70.0),
          child: Text(
            getTranslated(context, 'settingtitle'),
            style: TextStyle(
                color: ktextcolor,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300]),
            // color: Colors.red,
          ),
          margin: EdgeInsets.all(10),
          height: getProportionateScreenHeight(500),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, LanguageScreen.routeName),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Container(
                          child: Text(
                            getTranslated(context, 'language'),
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(19),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                color: ktextcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(onTap:(){
                  Share.share('check out my website https://demo.asol-tec.com/heeder/');
                },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Container(
                          child: Text(
                            getTranslated(context, 'shareapp'),
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(19),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                color: ktextcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => showMyDialog(context),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Container(
                          child: Text(
                            getTranslated(context, 'ratingapp'),
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(19),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                color: ktextcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, MailScreen.routeName),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.headset),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Container(
                          child: Text(
                            getTranslated(context, 'mail'),
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(19),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                color: ktextcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AboutApp.routeName),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.block),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Container(
                          child: Text(
                            getTranslated(context, 'about'),
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(19),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                color: ktextcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, UserCondtion.routeName),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.access_alarm),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Container(
                          child: Text(
                            getTranslated(context, 'cond'),
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(19),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600,
                                color: ktextcolor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                Divider(
                  color: Colors.black,
                ),
                _token == null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.exit_to_app),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Container(
                                child: Text(
                                  getTranslated(context, 'loginText'),
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(19),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w600,
                                      color: ktextcolor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          SharedPreferences.getInstance().then(
                            (value) => value.clear(),
                          );
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.exit_to_app),
                              SizedBox(
                                width: getProportionateScreenWidth(20),
                              ),
                              Container(
                                child: Text(
                                  getTranslated(context, 'logout'),
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(19),
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w600,
                                      color: ktextcolor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            getTranslated(context, 'ratingapp'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          content: Column(
            children: [
              Text(
                getTranslated(context, 'go'),
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenWidth(13),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(4),
              ),
              Text(
                getTranslated(context, 'apptit'),
                style:
                    TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w400),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(getTranslated(context, 'ex')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(getTranslated(context, 'gofor')),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }
}
