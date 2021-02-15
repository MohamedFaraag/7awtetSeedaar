import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mlahem/Screens/HomeScreen.dart';
import 'package:mlahem/widgets/customTapBar.dart';
import 'package:mlahem/widgets/customTapBar2.dart';

import 'package:shared_preferences/shared_preferences.dart';

String _role;
String _token;
String massage = '';

class SplScreen extends StatefulWidget {
  static String routeName = "/splscreen";

  @override
  _SplScreenState createState() => _SplScreenState();
}

class _SplScreenState extends State<SplScreen> {
  Future _getRole() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _role = prefs.getString('role');
      _token = prefs.getString('token');
      print(_role);
      print(_token);
    });
  }

  @override
  void initState() {
    _getRole();
    Timer(
      Duration(seconds: 2),
      () {
        print(_token);
        _token == null
            ? Navigator.pushReplacementNamed(context, HomeScreen.routeName)
            : _role == 'admin'
                ? Navigator.pushReplacementNamed(
                    context, MainTapbarr2.routeName)
                : Navigator.pushReplacementNamed(
                    context, MainTapbarr.routeName);
      },
    );
    super.initState();
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
