import 'package:flutter/material.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:flutter/cupertino.dart';
import 'package:mlahem/newpassword/controller.dart';
import 'package:mlahem/utils/resuable.dart';
import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/language/Local_localization.dart';

class UpdatePasswordScreen extends StatefulWidget {
  // static String routeName = '/UpdatePasswordScreen';
  final String phone;
  final String phone22;
  UpdatePasswordScreen(this.phone,this.phone22);
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UpdatePassController _updatepassController = UpdatePassController();
  String massege;
  var _newpass;
  TextEditingController phoneController;
  bool _loading = false;

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result =
        await _updatepassController.userpass(newpass: _newpass,phone:widget.phone22);
    print(widget.phone22);
    setState(() {
      _loading = false;
    });
    print(_result);
    if (_result['success'] == true) {
      showMyDialogforDone(context);
    } else
      showMyDialogforerror(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ktext2color),
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  getTranslated(context, 'newpass'),
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenWidth(24),
                    color: ktext2color,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(3),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  getTranslated(context, 'inpass'),
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(24),
                      color: kheadlinecolor),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(3),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(

                  cursorColor: ktextcolor,
                  controller: phoneController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return getTranslated(context, 'error');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _newpass = value;
                    });
                  },
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: getProportionateScreenWidth(16),
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '***********',
                    labelStyle: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: getProportionateScreenWidth(18),
                    ),
                    labelText: getTranslated(context, 'pass'),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(340),
                  child: _loading
                      ? Reusable.showLoader(_loading,
                          width: getProportionateScreenHeight(50),
                          height: getProportionateScreenHeight(50))
                      : Center(
                          child: Container(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(340),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: ktext2color,
                              child: Text(
                                getTranslated(context, 'sav'),
                                style: TextStyle(
                                    color: kraisedbuttoncolor,
                                    fontSize: getProportionateScreenWidth(18),
                                    fontFamily: 'Caior'),
                              ),
                              onPressed: () {
                                _submitForm();
                                setState(() {
                                  _loading = true;
                                });
                              },
                            ),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showMyDialogforDone(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            getTranslated(context, 'change'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(getTranslated(context, 'gooo')),
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
            ),
          ],
        );
      },
    );
  }

  showMyDialogforerror(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'كلمه المرور يجب الاتقل عن 4 ارقام',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              color: Colors.red,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
