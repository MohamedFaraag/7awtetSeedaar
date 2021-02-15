import 'package:flutter/material.dart';

import 'package:mlahem/Models/pageView_model.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/widgets/customTapBar.dart';

import 'package:mlahem/widgets/indecator.dart';
import 'package:mlahem/widgets/myText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pview extends StatefulWidget {
  static String routeName = "/pview";
  @override
  _PviewState createState() => _PviewState();
}

class _PviewState extends State<Pview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Data> myData = [
      Data(
        title: getTranslated(context, 'pageview1'),
        descriptions: getTranslated(context, 'pageview2'),
        subdesc: getTranslated(context, 'pageview3'),
        imageUrl: 'assets/images/img.png',
        subimageUrl: 'assets/images/citylogo.png',
      ),
      Data(
        title: getTranslated(context, 'pageview4'),
        descriptions: getTranslated(context, 'pageview5'),
        subdesc: getTranslated(context, 'pageview6'),
        imageUrl: 'assets/images/img01.png',
        subimageUrl: '',
      ),
      Data(
        title: getTranslated(context, 'pageview7'),
        descriptions: getTranslated(context, 'pageview8'),
        subdesc: getTranslated(context, 'pageview9'),
        imageUrl: 'assets/images/img02.png',
        subimageUrl: '',
      )
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: myData
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          item.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Container(
                          height: getProportionateScreenHeight(200),
                          width: getProportionateScreenWidth(180),
                          child: Image.asset(
                            item.subimageUrl,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              MyText(item.title, s),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              MyText(item.descriptions, s),
                              MyText(item.subdesc, s)
                            ],
                          ),
                        ),
                        Indecator(currentIndex),
                        SizedBox(
                          height: getProportionateScreenHeight(50),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
          ),
          Align(
            alignment: Alignment(0, 0.90),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: RaisedButton(
                color: ktext2color,
                onPressed: () async {

                  Navigator.pushReplacementNamed(
                      context, MainTapbarr.routeName);
                  SharedPreferences prefsfor = await SharedPreferences.getInstance();
                  prefsfor.setBool('x', true);
                },
                child: Text(
                  getTranslated(context, 'buttonText'),
                  style: TextStyle(
                    color: kraisedbuttoncolor,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    fontSize: getProportionateScreenWidth(18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
