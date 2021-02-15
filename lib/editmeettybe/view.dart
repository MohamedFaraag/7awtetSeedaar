import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:flutter/material.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/widgets/customTapBar2.dart';
import 'package:path/path.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditMeettybeView extends StatefulWidget {
  static String routeName = '/EditMeettybeView';

  @override
  _EditMeettybeViewState createState() => _EditMeettybeViewState();
}

String name;
var slgDate;
var age;
String image;
String nameafter;
var slgDateafter;
var ageafter;
// TextEditingController namecontroller = TextEditingController();
// TextEditingController phonecontroller = TextEditingController();
// TextEditingController addresscontroller = TextEditingController();
// GlobalKey<FormState> _azzcKey = GlobalKey<FormState>();
int cid = 0;

class _EditMeettybeViewState extends State<EditMeettybeView> {
  @override
  void initState() {
    super.initState();
  }

  // TextEditingController slgDatecontroller = TextEditingController();
  // TextEditingController namecontroller = TextEditingController();
  // TextEditingController agecontroller = TextEditingController();

  File _file;
  Future getFile() async {
    File file = await FilePicker.getFile();

    setState(() {
      _file = file;
    });
  }

  void _uploadFile(BuildContext context, filePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    setState(() {
      pr.show();
    });

    String fileName = basename(filePath.path);
    print("file base name:$fileName");

    try {
      FormData formData = new FormData.fromMap({
        "slaughter_date": slgDateafter == null ? slgDate : slgDateafter,
        "age": ageafter == null ? age : ageafter,
        "meet_type": nameafter == null ? name : nameafter,
        "image":
            await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio().post(
        "https://demo.asol-tec.com/heeder/public/api/meet_types/update/$cid",
        data: formData,
        options: Options(
          headers: {
            'Authorization': prefs.getString('token'),
          },
        ),
      );
      print(cid);
      print("File upload response: $response");
      print(response.data);
      if (response.data['status'] ==
          'You are not An Admin Or A Moderator sorry!') {
        pr.hide();
        showMyDialog(context);
      } else {
        pr.hide();
        showMyDialog2(context);
      }
    } catch (e) {
      print("expectation Caugch: $e");
      pr.hide();
    }
  }

  void _uploadwithoutImage(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    setState(() {
      pr.show();
    });

    try {
      FormData formData = new FormData.fromMap({
        "slaughter_date": slgDateafter == null ? slgDate : slgDateafter,
        "age": ageafter == null ? age : ageafter,
        "meet_type": nameafter == null ? name : nameafter,
      });

      Response response = await Dio().post(
        "https://demo.asol-tec.com/heeder/public/api/meet_types/update/$cid",
        data: formData,
        options: Options(
          headers: {
            'Authorization': prefs.getString('token'),
          },
        ),
      );
      print(cid);
      print("File upload response: $response");
      print(response.data);
      if (response.data['status'] ==
          'You are not An Admin Or A Moderator sorry!') {
        pr.hide();
        showMyDialog(context);
      } else {
        pr.hide();
        showMyDialog2(context);
      }
    } catch (e) {
      print("expectation Caugch: $e");
      pr.hide();
    }
  }

  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    setState(() {
      cid = routeArg['id'];
      image = routeArg['image'];
      name = routeArg['name'];
      slgDate = routeArg['date'];
      age = routeArg['age'];
    });

    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(
      message: getTranslated(context, 'aa'),
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
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
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: getFile,
                            child: Container(
                              height: 200,
                              margin: EdgeInsets.all(15),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                image: DecorationImage(
                                    image: _file == null
                                        ? NetworkImage(image)
                                        : FileImage(_file),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: getFile,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.red),
                              margin: EdgeInsets.only(left: 0, top: 0),
                              child: Icon(
                                Icons.add,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    getTranslated(context, 'edit'),
                    style: TextStyle(
                      color: kheadlinecolor,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(26),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (va) {
                            nameafter = va;
                          },
                          cursorColor: ktextcolor,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(16),
                          ),
                          decoration: InputDecoration(
                            hintText: name,
                            labelStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: getProportionateScreenWidth(18),
                            ),
                            labelText: getTranslated(context, 'namestore'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          onChanged: (val1) {
                            slgDateafter = val1;
                          },
                          cursorColor: ktextcolor,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(16),
                          ),
                          decoration: InputDecoration(
                            hintText: slgDate,
                            labelStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: getProportionateScreenWidth(18),
                            ),
                            labelText: getTranslated(context, 'da'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (val2) {
                            ageafter = val2;
                          },
                          cursorColor: ktextcolor,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(16),
                          ),
                          decoration: InputDecoration(
                            hintText: age.toString(),
                            labelStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: getProportionateScreenWidth(18),
                            ),
                            labelText: getTranslated(context, 'age'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(90),
                ),
                Container(
                  height: getProportionateScreenHeight(50),
                  width: double.infinity,
                  child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        getTranslated(context, 'addbutton'),
                        style: TextStyle(
                            color: kraisedbuttoncolor,
                            fontSize: getProportionateScreenWidth(18),
                            fontFamily: 'Caior'),
                      ),
                      onPressed: () {
                        if (_file == null) {
                          _uploadwithoutImage(context);
                        } else {
                          _uploadFile(context, _file);
                        }
                        // ignore: unused_local_variable
                        // String name = namecontroller.text;
                        // var phone = phonecontroller.text;
                        // String address = addresscontroller.text;
                        // print(phone);
                        // print(address);
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Future removeImage() async {
    setState(() {
      _file = null;
    });
  }
}

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          getTranslated(context, 'alerterror'),
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              getTranslated(context, 'ex'),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialog2(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          getTranslated(context, 'done'),
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              getTranslated(context, 'ex'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MainTapbarr2.routeName);
            },
          ),
        ],
      );
    },
  );
}
