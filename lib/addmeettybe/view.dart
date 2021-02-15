import 'package:flutter/material.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/addmeettybe/controller.dart';

class MeetTybeViewForman extends StatefulWidget {
  static String routeName = '/MeetTybeController';

  @override
  _MeetTybeViewFormanState createState() => _MeetTybeViewFormanState();
}

class _MeetTybeViewFormanState extends State<MeetTybeViewForman> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
        iconTheme: IconThemeData(color: ktext2color),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  getTranslated(context, 'meettybe'),
                  style: TextStyle(
                    color: kheadlinecolor,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(26),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(190),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AddMeettybeController.routeName);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/images/addimg.png'),
                          Text(
                            getTranslated(context, 'add'),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(120),
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  backgroundColor: ktext2color,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AddMeettybeController.routeName);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
