import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/widgets/customTapBar2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:path/path.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddMeettybeController extends StatefulWidget {
  static String routeName = '/AddMeettybeController22';
  @override
  _AddMeettybeControllerState createState() => _AddMeettybeControllerState();
}

int id;
TextEditingController slgDatecontroller = TextEditingController();
TextEditingController namecontroller = TextEditingController();

TextEditingController agecontroller = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _AddMeettybeControllerState extends State<AddMeettybeController> {
  File _file;
  Future getFile() async {
    File file = await FilePicker.getFile();

    setState(() {
      _file = file;
    });
  }

  void _uploadFile(filePath, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    setState(() {
      pr.show();
    });

    String fileName = basename(filePath.path);
    print("file base name:$fileName");

    try {
      FormData formData = new FormData.fromMap({
        "slaughter_date": slgDatecontroller.text.trim(),
        "store_id": id,
        "meet_type": namecontroller.text.trim(),
        "image":
            await MultipartFile.fromFile(filePath.path, filename: fileName),
        "age": agecontroller.text.trim(),
      });

      Response response = await Dio().post(
        "https://demo.asol-tec.com/heeder/public/api/meet_types",
        data: formData,
        options: Options(
          headers: {'Authorization': prefs.getString('token')},
        ),
      );
      print("File upload response: $response");
      print(response.data);
      if (response.data['status'] ==
          'You are not An Admin Or A Moderator sorry!') {
        pr.hide();
        showMyDialog(context);
      } else {
        pr.hide();
        // showMyDialog2(context);
        showMyDialog(context);
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
      id = routeArg['id'];
    });
    print(id);
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
        iconTheme: IconThemeData(color: ktext2color),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
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
                            height: getProportionateScreenHeight(200),
                            width: getProportionateScreenWidth(300),
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey),
                              image: DecorationImage(
                                  image: _file == null
                                      ? AssetImage('assets/images/addimg.png')
                                      : FileImage(_file),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            // child: _image == null
                            //     ? Image.asset('assets/images/addimg.png')
                            //     : FileImage(_image),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: getFile,
                        //   child: Container(
                        //     padding: EdgeInsets.all(5),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(40.0),
                        //         color: Colors.black),
                        //     margin: EdgeInsets.only(left: 70, top: 180),
                        //     child: Icon(
                        //       Icons.photo_camera,
                        //       size: 25,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: removeImage,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.red),
                            margin: EdgeInsets.only(left: 0, top: 0),
                            child: Icon(
                              Icons.cancel,
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
                  getTranslated(context, 'add2'),
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
              // Container(
              //   margin: EdgeInsets.all(15),
              //   padding: EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blueGrey),
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(20),
              //     ),
              //   ),
              //   child: Center(
              //     child: GestureDetector(
              //         onTap: () {},
              //         child: Column(
              //           children: [
              //             Image.asset('assets/images/addimg.png'),
              //             Text(
              //               'إضافة صورة الملحمة ( إختياري )',
              //               style: TextStyle(
              //                 fontFamily: 'Cairo',
              //                 fontWeight: FontWeight.w400,
              //               ),
              //             )
              //           ],
              //         )),
              //   ),
              // ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return getTranslated(context, 'errorlab2');
                          }
                          return null;
                        },
                        controller: namecontroller,
                        cursorColor: ktextcolor,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: getProportionateScreenWidth(16),
                        ),
                        decoration: InputDecoration(
                          hintText: getTranslated(context, 'thename'),
                          labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(18),
                          ),
                          labelText: getTranslated(context, 'namestore'),
                        ),
                        // onChanged: (String name) {
                        //   setState(() {
                        //     _name = name;
                        //     print(_name);
                        //   });
                        // },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'املى هذا الحقل ';
                          }
                          return null;
                        },
                        controller: slgDatecontroller,
                        cursorColor: ktextcolor,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: getProportionateScreenWidth(16),
                        ),
                        decoration: InputDecoration(
                          hintText: '11/11/2020',
                          labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(18),
                          ),
                          labelText: getTranslated(context, 'da'),
                        ),
                        // onChanged: (String phone) {
                        //   _phone = phone;
                        //   print(_phone);
                        // },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: agecontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return getTranslated(context, 'errolab');
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        cursorColor: ktextcolor,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: getProportionateScreenWidth(16),
                        ),
                        decoration: InputDecoration(
                          hintText: getTranslated(context, 'age'),
                          labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(18),
                          ),
                          labelText: getTranslated(context, 'age'),
                        ),
                        // onChanged: (String address) {
                        //   _address = address;
                        //   print(_address);
                        // },
                      ),
                    ),
                  ],
                ),
              ),
              //Text(massage),
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
                      _uploadFile(_file, context);
                      // _startUploading();
                      // _submitForm();
                      // print(_phone);
                      // print(result);
                      // await SharedPreferences.getInstance().then((value) {
                      //   addData(
                      //     namecontroller.text,
                      //     phonecontroller.text,
                      //     addresscontroller.text,
                      //     value.getString('token'),
                      //   );
                      //   print(namecontroller.text);
                      //   print(phonecontroller.text);
                      //   print(addresscontroller.text);
                      if (_formKey.currentState.validate()) {}
                      // ignore: unused_local_variable
                      String name = namecontroller.text;
                      var slgDate = slgDatecontroller.text;
                      String age = agecontroller.text;
                      print(slgDate);
                      print(age);
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future removeImage() async {
    setState(() {
      _file = null;
    });
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              getTranslated(context, 'done4'),
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w400,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(getTranslated(context, 'ex')),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, MainTapbarr2.routeName);
                },
              ),
            ],
          );
        });
  }
}
