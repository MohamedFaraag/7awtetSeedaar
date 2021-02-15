import 'package:flutter/material.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/widgets/customTextFiled.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:mlahem/widgets/customTapBar.dart';

class MailScreen extends StatefulWidget {
  static String routeName = '/MailScreen';

  @override
  _MailScreenState createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  TextEditingController phonecontroller = TextEditingController();
  void _uploadcomplaints(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    setState(() {
      pr.show();
    });

    try {
      FormData formData = new FormData.fromMap({
        "name": username,
        "phone": phonecontroller.text.trim(),
        "message": problem,
        'user_id': 1
      });

      Response response = await Dio().post(
        "https://demo.asol-tec.com/heeder/public/api/complaints",
        data: formData,
        options: Options(
          headers: {'Authorization': prefs.getString('token')},
        ),
      );

      print(response.data);
      pr.hide();
      showMyDialog2(context);
    } catch (e) {
      print("expectation Caugch: $e");
      pr.hide();
    }
  }

  ProgressDialog pr;

  String username, problem;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ktext2color),
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  getTranslated(context, 'mail'),
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenWidth(24),
                  ),
                ),
              ),
              CustomTextFiled(
                getTranslated(context, 'filed2'),
                getTranslated(context, 'filled2'),
                (value) {
                  username = value;
                },
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: ktextcolor,
                  validator: (value) {
                    if (value.isEmpty) {
                      return getTranslated(context, 'filled2');
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: getProportionateScreenWidth(16),
                  ),
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    hintText: getTranslated(context, 'num'),
                    labelStyle: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: getProportionateScreenWidth(16),
                    ),
                    labelText: getTranslated(context, 'phonenum'),
                  ),
                ),
              ),
              CustomTextFiled(
                getTranslated(context, 'write'),
                getTranslated(context, 'write'),
                (value) {
                  problem = value;
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(220),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text(
                    getTranslated(context, 'send'),
                    style: TextStyle(
                        color: kraisedbuttoncolor,
                        fontSize: getProportionateScreenWidth(18),
                        fontFamily: 'Caior'),
                  ),
                  onPressed: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      print(username);
                      print(problem);
                      print(phonecontroller.text);
                    }
                    _uploadcomplaints(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
            getTranslated(context, 'done2'),
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
                Navigator.pushReplacementNamed(context, MainTapbarr.routeName);
              },
            ),
          ],
        );
      },
    );
  }
}
