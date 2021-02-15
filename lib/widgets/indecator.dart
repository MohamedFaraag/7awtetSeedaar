import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';

class Indecator extends StatelessWidget {
  final int index;

  Indecator(this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildcontainer(index == 0 ? Colors.green : Colors.grey),
        buildcontainer(index == 1 ? Colors.green : Colors.grey),
        buildcontainer(index == 2 ? Colors.green : Colors.grey),
      ],
    );
  }
}

Container buildcontainer(Color color) {
  return Container(
    margin: EdgeInsets.all(5),
    height: getProportionateScreenHeight(11),
    width: getProportionateScreenWidth(11),
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}
