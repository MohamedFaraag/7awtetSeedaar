import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';

class AboutApp extends StatelessWidget {
  static String routeName = '/AboutApp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ktext2color),
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: getProportionateScreenHeight(30),
                  child: Text(
                    getTranslated(context, 'about'),
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  getTranslated(context, 'aboutText'),
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
