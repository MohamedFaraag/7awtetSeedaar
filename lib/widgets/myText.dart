import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

TextStyle s = TextStyle(
  fontFamily: 'Cairo',
  fontSize: getProportionateScreenWidth(18),
  color: kraisedbuttoncolor,
  fontWeight: FontWeight.w400,
);

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String text;
  TextStyle textStyle;
  MyText(this.text, this.textStyle);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: s,
    );
  }
}
