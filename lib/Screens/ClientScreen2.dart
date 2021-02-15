import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/widgets/customTapBar2.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ClientScreen2 extends StatefulWidget {
  static String routeName = "/clientscreen2";

  @override
  _ClientScreen2State createState() => _ClientScreen2State();
}

class _ClientScreen2State extends State<ClientScreen2> {
  String _token;
  @override
  void initState() {
    _getToken();
    Timer(
      Duration(seconds: 2),
      () {
        print(_token);
        _token == null
            ? Navigator.pushNamed(context, LoginScreen.routeName)
            : Navigator.pushNamed(context, MainTapbarr2.routeName);
      },
    );
    super.initState();
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
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
