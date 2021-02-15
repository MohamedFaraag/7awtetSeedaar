import 'package:flutter/material.dart';
import 'package:mlahem/Models/new_users_model.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/login/newusersController.dart';
import 'package:mlahem/utils/resuable.dart';
import 'package:international_phone_input/international_phone_input.dart';

class NewUsersView extends StatefulWidget {
  static String routeName = '/newusersview';

  @override
  _NewUsersViewState createState() => _NewUsersViewState();
}

class _NewUsersViewState extends State<NewUsersView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NewusersController _newusersController =NewusersController();
  NewuserModel _newuserModel =NewuserModel();
  String _name;
  String _phone;
  String _password;
  String _password_confirmation;
  String phoneNumber;
  bool _loading = false;
  String massage;
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      print(internationalizedPhoneNumber);
      _phone = number;
      print(number);
      print(_phone);
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
    await _newusersController.newuser(name: _name,password: _password,phone: _phone,password_confirmation: _password_confirmation);
    setState(() {
      _loading = false;
    });
    //print(_result);
    if (_result['success']) {
        print('Response Done');
        print(_result);
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {
      print('Response error');
      print(massage);
      massage = getTranslated(context, 'error');
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
                getTranslated(context, 'newusers'),
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
                initialPhoneNumber: _phone,
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
                    return getTranslated(context, 'errors');
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                     _name = value;
                  });
                },
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: getProportionateScreenWidth(16),
                ),
                decoration: InputDecoration(
                  hintText: '',
                  labelStyle: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: getProportionateScreenWidth(16),
                  ),
                  labelText: getTranslated(context, 'name'),
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     keyboardType: TextInputType.phone,
            //     cursorColor: ktextcolor,
            //     validator: (value) {
            //       if (value.isEmpty) {
            //         return getTranslated(context, 'errors');
            //       }
            //       return null;
            //     },
            //     onSaved: (value) {
            //       setState(() {
            //          _phone = value;
            //       });
            //     },
            //     style: TextStyle(
            //       fontFamily: 'Cairo',
            //       fontSize: getProportionateScreenWidth(16),
            //     ),
            //     decoration: InputDecoration(
            //       hintText: '',
            //       labelStyle: TextStyle(
            //         fontFamily: 'Cairo',
            //         fontSize: getProportionateScreenWidth(16),
            //       ),
            //       labelText: getTranslated(context, 'phonenum'),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: ktextcolor,
                validator: (value) {
                  if (value.isEmpty) {
                    return getTranslated(context, 'errors');
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: ktextcolor,
                validator: (value) {
                  if (value.isEmpty) {
                    return getTranslated(context, 'errors');
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                     _password_confirmation = value;
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
                  labelText: getTranslated(context, 'confirmpass'),
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
                    getTranslated(context, 'newusers'),
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
          ],
        ),
      ),
    ));
  }
}
