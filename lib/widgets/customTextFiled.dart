import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  final String hint;
  final String label;
  Function onClick;
  IconData iconData;

  CustomTextFiled(
    this.hint,
    this.label,
    this.onClick,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return getTranslated(context, 'errorFiled');
          }
        },
        onSaved: onClick,
        cursorColor: ktextcolor,
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: getProportionateScreenWidth(16),
        ),

        decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          hintText: hint,
          labelStyle: TextStyle(
            fontFamily: 'Cairo',
            fontSize: getProportionateScreenWidth(18),
          ),
          labelText: label,
        ),
      ),
    );
  }
}
