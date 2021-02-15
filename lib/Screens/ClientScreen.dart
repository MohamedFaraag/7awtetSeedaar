import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:mlahem/PageView/view.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/widgets/customTapBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientScreen extends StatefulWidget {
  static String routeName = "/clientscreen";

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  bool direction;
  _getbool() async {
    final SharedPreferences prefsfor = await SharedPreferences.getInstance();

    direction = prefsfor.getBool('x');

  }
  @override
  void initState() {
    _getbool();
    Timer(
      Duration(seconds: 2),
      () {
        (direction==false || direction==null)? Navigator.pushReplacementNamed(context, Pview.routeName): Navigator.pushReplacementNamed(context, MainTapbarr.routeName);

        //Navigator.pushReplacementNamed(context, AddStoreView.routeName);

        //Navigator.pushReplacementNamed(context, MainTapbarr2.routeName);
      },
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logomalahem@2x.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
