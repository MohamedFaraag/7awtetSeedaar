import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:mlahem/Models/login_model.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/forgetpassword/view.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/login/LoginController.dart';
import 'package:mlahem/login/newusersView.dart';
import 'package:mlahem/utils/resuable.dart';
import 'package:mlahem/widgets/customTapBar.dart';
import 'package:mlahem/widgets/customTapBar2.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/lc';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController _loginController = LoginController();
  // ignore: unused_field
  LoginModel _loginModel = LoginModel();
  // String _phone;
  String phoneNumber;
  String phone;
  String _password;
  bool _loading = false;
  String massage;
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      print(internationalizedPhoneNumber);
      phone = number;
      print(number);
      print(phone);
    });
  }
  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result =
        await _loginController.userLogin(phone: phone, password: _password);
    setState(() {
      _loading = false;
    });
    //print(_result);
    if (_result['success']) {
      print('Response Done');
      print(_result);
      if (_result['result'] == "admin") {
        print('Your are Admin');
        Navigator.pushReplacementNamed(context, MainTapbarr2.routeName);
      } else {
        Navigator.pushReplacementNamed(context, MainTapbarr.routeName);

        print('Your are User');
      }
    } else {
      print('Response error');
      massage = getTranslated(context, 'errorloging');
      print(massage);
      print(_result['success']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                  getTranslated(context, 'loginText'),
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenWidth(24),
                    color: ktext2color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InternationalPhoneInput(
                  decoration:
                  InputDecoration.collapsed(hintText: '555xxxxxx'),
                  onPhoneNumberChange: onPhoneNumberChange,
                  initialPhoneNumber: phone,
                  initialSelection: 'SA',
                  showCountryCodes: true,
                ),
              ),
              Divider(color: Colors.black,),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: ktextcolor,
                  validator: (value) {
                    if (value.isEmpty) {
                      return getTranslated(context, 'errorlogin');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _password = value;
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
                      fontSize: getProportionateScreenWidth(16),
                    ),
                    labelText: getTranslated(context, 'pass'),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8.0),
              ),
              Center(
                child: Text(
                  massage ?? '',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontFamily: 'Cairo',
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Center(
                child: Container(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(340),
                  child: _loading
                      ? Reusable.showLoader(_loading,
                          width: getProportionateScreenHeight(50),
                          height: getProportionateScreenHeight(50))
                      : RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: ktext2color,
                          child: Text(
                            getTranslated(context, 'loginText'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(18),
                                fontFamily: 'Cairo'),
                          ),
                          onPressed: () {
                            _submitForm();
                          },
                        ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              SizedBox(
                height: getProportionateScreenHeight(12),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Center(
                  child: Text(
                    getTranslated(context, 'forgettext'),
                    style: TextStyle(
                      color: ktext2color,
                      fontSize: getProportionateScreenWidth(18),
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              GestureDetector(
                onTap: () =>Navigator.pushNamed(context, NewUsersView.routeName),
                child: Center(
                  child: Text(
                    getTranslated(context, 'newusers'),
                    style: TextStyle(
                        color: ktext2color,
                        fontSize: getProportionateScreenWidth(18),
                        fontFamily: 'Cairo'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
