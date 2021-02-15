import 'package:flutter/material.dart';

class ViewPhoto extends StatelessWidget {
  static String routeName = 'viewphoto';
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    String image = routeArg['image'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          child: null,
        ),
      ),
    );
  }
}
