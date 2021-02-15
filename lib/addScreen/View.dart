import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:flutter/material.dart';
import 'package:mlahem/language/Local_localization.dart';

import 'package:path/path.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mlahem/widgets/customTapBar2.dart';

class AddStoreView extends StatefulWidget {
  static String routeName = '/addStoreView';

  @override
  _AddStoreViewState createState() => _AddStoreViewState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController addresscontroller = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// ignore: unused_element
//AddStoreController _addStoreController = AddStoreController();
//AddController _addController = AddController();
// ignore: unused_element
// AddStoremodel _addStoreResponseModel = AddStoremodel();
// String _name;
// String _phone;
// String _address;

// String _token;
// String address;
// ignore: unused_element
//bool _loading = true;
// String massage;

class _AddStoreViewState extends State<AddStoreView> {
  @override
  void initState() {
    // _getToken();
    // print('Token For This Page Is$_token');
    super.initState();
  }

  // _getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _token = prefs.getString('token');
  //   });
  // }

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
        "name": namecontroller.text.trim(),
        "phone": phonecontroller.text.trim(),
        "address": addresscontroller.text.trim(),
        "image":
            await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio().post(
        "https://demo.asol-tec.com/heeder/public/api/stores",
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
        showMyDialog2(context);
      }
    } catch (e) {
      print("expectation Caugch: $e");
      pr.hide();
    }
  }

  ProgressDialog pr;
  // String _name;
  // String _phone;
  // String _address;
  // File _image;
  // String img =
  //     'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png';
  // var name = TextEditingController();
  // var phone = TextEditingController();
  // var address = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // @override
  // void dispose() async {
  //   namecontroller.dispose();
  //   phonecontroller.dispose();
  //   addresscontroller.dispose();
  //   super.dispose();
  // }

  // void _submitForm() async {
  //   if (!_formKey.currentState.validate()) {
  //     return;
  //   }
  //   _formKey.currentState.save();
  //   setState(() {
  //     _loading = true;
  //   });
  //   Map<String, dynamic> _result = await _addStoreController.addData(
  //       name: _name, phone: _phone, address: _address);
  //   setState(() {
  //     _loading = false;
  //   });
  //   //print(_result);
  //   if (_result['success'] == true) {
  //     print('Done1');
  //     //print(_result);
  //   } else {
  //     print('error');
  //     // print(_result['success']);
  //   }
  // }
// Future uploadImage(filepath) async {
//     String fileName = basename(filepath);
//     print(fileName);
//     try {
//       FormData formData = new FormData.fromMap({
//         'name': 'sadasd',
//         'phone': 'asdasd',
//         'image':
//             await MultipartFile.fromFile(filepath.path, filename: fileName),
//       });
//     } catch (e) {}

  @override
  Widget build(BuildContext context) {
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

                            height: 200,
                            //width: getProportionateScreenWidth(300),
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
                            child: _file == null ? Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            ):Icon(
                              Icons.cancel,
                              size: 25,
                              color: Colors.white,
                          ),
                        )
                          ) ],
                    ),
                  ],
                ),
              ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                    getTranslated(context, 'addstore'),
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
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return getTranslated(context, 'errors');
                          }
                          return null;
                        },
                        controller: phonecontroller,
                        cursorColor: ktextcolor,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: getProportionateScreenWidth(16),
                        ),
                        decoration: InputDecoration(
                          hintText: '555xxxxxx',
                          labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(18),
                          ),
                          labelText:getTranslated(context, 'phonenum'),
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
                        controller: addresscontroller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return getTranslated(context, 'errolab');
                          }
                          return null;
                        },
                        cursorColor: ktextcolor,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: getProportionateScreenWidth(16),
                        ),
                        decoration: InputDecoration(
                          hintText: getTranslated(context, 'dis'),
                          labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: getProportionateScreenWidth(18),
                          ),
                          labelText: getTranslated(context, 'label'),
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
                      var phone = phonecontroller.text;
                      String address = addresscontroller.text;
                      print(phone);
                      print(address);
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }

  // void _onAlertPress(BuildContext context) async {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return new CupertinoAlertDialog(
  //           actions: [
  //             CupertinoDialogAction(
  //               isDefaultAction: true,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: <Widget>[
  //                   Icon(Icons.add_a_photo, size: 90),
  //                   Text('Gallery'),
  //                 ],
  //               ),
  //               onPressed: () {},
  //             ),
  //             CupertinoDialogAction(
  //               isDefaultAction: true,
  //               child: Column(
  //                 children: <Widget>[
  //                   Image.asset(
  //                     'assets/images/addimg.png',
  //                     width: 50,
  //                   ),
  //                   Text('Take Photo'),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  // Future getCameraImage() async {
  //   final image = await ImagePicker().getImage(source: ImageSource.camera);

  //   setState(() {
  //     _image = File(image.path);
  //     Navigator.pop(context);
  //   });
  // }

  // Future getGalleryImage() async {
  //   var image = await FilePicker.getFile();

  //   setState(() {
  //     _image = File(image.path);
  //     Navigator.pop(context);
  //   });
  // }

  Future removeImage() async {
    setState(() {
      _file = null;
    });
  }
}
//   Future uploadImage() async {
//     if (_image == null) return;
//     String base64 = base64Encode(_image.readAsBytesSync());
//     // print(base64);
//     //print(_image);
//     String imagename = _image.path.split("/").last;
//     //print(imagename);

//     var url = 'https://demo.asol-tec.com/heeder/public/api/stores';
//     var data = {'image': base64, name: _name, phone: _phone, address: _address};
//     var response = await http.post(url, body: data, headers: {
//       'Authorization':
//           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MzQ0NzU0LCJuYmYiOjE2MDczNDQ3NTQsImp0aSI6IkxaT2JWeWRNNHBmZU16M3YiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.REwFKbWSS02U2TIv5OBRYXEYPKtiS8TkrF6x7soKHhA'
//     });
//     print(response);
//   }
// }

//Uri apiUrl = Uri.parse('https://demo.asol-tec.com/heeder/public/api/stores');

// Future<Map<String, dynamic>> _uploadImage(File image) async {
//   setState(() {
//     pr.show();
//   });
//   final mimeTypeData =
//       lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
//   final imageUploadRequest = http.MultipartRequest('POST', apiUrl);
//   final file = await http.MultipartFile.fromPath(
//     '_image',
//     image.path,
//     contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
//   );
//   imageUploadRequest.files.add(file);
//   imageUploadRequest.fields['name'] = _name;
//   imageUploadRequest.fields['phone'] = _phone;
//   imageUploadRequest.fields['address'] = _address;

//   try {
//     final streamedResponse = await imageUploadRequest.send();
//     final response = await http.Response.fromStream(streamedResponse);
//     if (response.statusCode != 200) {
//       return null;
//     }
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     _resetState();
//     return responseData;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

// void _startUploading() async {
//   if (_image != null || _name != '' || _phone != '' || _address != '') {
//     final Map<String, dynamic> response = await _uploadImage(_image);

//     // Check if any error occured
//     if (response == null) {
//       pr.hide();
//       messageAllert('User details updated successfully', 'Success');
//     }
//   } else {
//     messageAllert('Please Select a profile photo', 'Profile Photo');
//   }
// }

// void _resetState() {
//   setState(() {
//     pr.hide();
//     _name = null;
//     _phone = null;
//     _address = null;
//     _image = null;
//   });
// }

//   messageAllert(String msg, String ttl) {
//     Navigator.pop(context);
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return new CupertinoAlertDialog(
//             title: Text(ttl),
//             content: Text(msg),
//             actions: [
//               CupertinoDialogAction(
//                 isDefaultAction: true,
//                 child: Column(
//                   children: <Widget>[
//                     Text('Okay'),
//                   ],
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         });
//   }
// }

// Future<AddStoremodel> addData(String namecontroller, var phonecontroller,
//     String addresscontroller, String token) async {
//   String url = 'https://demo.asol-tec.com/heeder/public/api/stores';
//   final res = await post(url, headers: {
//     'Authorization':
//         'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MjcwNDczLCJuYmYiOjE2MDcyNzA0NzMsImp0aSI6InBnRzYyTjRnTkNmUzFBRkQiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.XtuvEZnQonEalMcAk2JP7Til1Ivs_61zg3YkP0L_mLw'
//   }, body: {
//     'name': namecontroller,
//     'phone': phonecontroller,
//     'address': addresscontroller,
//   });
//   var resuu2 = jsonDecode(res.body);
//   return AddStoremodel.fromJson(resuu2);
// }

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
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, MainTapbarr2.routeName);
            },
          ),
        ],
      );
    },
  );
}
