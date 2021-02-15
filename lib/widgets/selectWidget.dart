import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

// ignore: must_be_immutable
class Selected extends StatelessWidget {
  String text;
  IconData iconData;
  Selected(this.text, this.iconData);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(12), child: Icon(iconData)),
          Container(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(19),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: ktextcolor),
            ),
          ),
        ],
      ),
    );
  }
}
