import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reusable {
  static Widget showLoader(bool _load,
      {double width = double.infinity, double height = double.infinity}) {
    Widget loadingIndicator = _load
        ? new Container(
            color: Colors.white,
            width: width,
            height: height,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(
                    child: new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                ))),
          )
        : new Container();

    return loadingIndicator;
  }
}
