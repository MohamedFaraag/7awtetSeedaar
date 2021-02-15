import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/utils/resuable.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/optsscreen.dart';
import 'package:mlahem/forgetpassword/controller.dart';
import 'package:mlahem/Models/update_password_model.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = '/fps';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UpdateController _updateController = UpdateController();

  UpdatepasswordModel _updateDataModel = UpdatepasswordModel();

  String massage;

  String phone22;
  String phoneNumber;
  String verificationCode;
  TextEditingController otpController;
  TextEditingController phoneController;
  // ignore: unused_field
  bool _loading = false;
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // String verificationId;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      print(internationalizedPhoneNumber);
      phone22 = number;
      print(number);
      print(phone22);
    });
  }

  @override
  void initState() {
    otpController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    InternationalPhoneInput();
    super.dispose();
  }

  // Future<void> verifyPhone(phoneNo) async {
  //   final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
  //     verificationId = verId;
  //   };

  //   final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
  //     verificationId = verId;
  //     print(verId);
  //     print(verificationId);
  //     print(verificationId);
  //   };

  //   final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {
  //     firebaseAuth.signInWithCredential(auth).then((AuthResult value) {
  //       if (value.user != null) {
  //         FirebaseUser user = value.user;
  //         userAuthorized();
  //       } else {
  //         debugPrint('user not authorized');
  //       }
  //     }).catchError((error) {
  //       debugPrint('error : $error');
  //     });
  //   };

  //   final PhoneVerificationFailed veriFailed = (AuthException exception) {
  //     print('${exception.message}');
  //   };

  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNo,
  //       codeAutoRetrievalTimeout: autoRetrieve,
  //       codeSent: smsCodeSent,
  //       timeout: const Duration(seconds: 5),
  //       verificationCompleted: verifiedSuccess,
  //       verificationFailed: veriFailed);
  // }

  // void verifyOTP(String smsCode) async {
  //   var _authCredential = PhoneAuthProvider.getCredential(
  //       verificationId: verificationId, smsCode: smsCode);
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return Container(
  //           child: Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //         );
  //       });
  //   firebaseAuth
  //       .signInWithCredential(_authCredential)
  //       .then((AuthResult result) {
  //     FirebaseUser user = result.user;

  //     if (user != null) {
  //       userAuthorized();
  //     }

  //     ///go To Next Page
  //   }).catchError((error) {
  //     Navigator.pop(context);
  //     print('Invalid Phone');
  //   });
  // }

  // userAuthorized() {
  //   print('can go to next page');
  //   //Navigator.pushNamed(context, MainTapbarr.routeName);
  // }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result =
        await _updateController.uerpass(phone: phone22);
    setState(() {
      _loading = false;
    });
    //print(_result);
    if (_result['success'] == true) {
      print('Response Done');
      print(_result['success']);
      print(_result);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OTPScreen(phoneNumber,phone22),
        ),
      );
    } else {
      print('Response error');
      massage = getTranslated(context, 'wrong');
      print(massage);
      print(_result['success']);
    }
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
                  getTranslated(context, 'forgettext'),
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
                  getTranslated(context, 'input'),
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
                padding: const EdgeInsets.all(8.0),
                child: InternationalPhoneInput(
                  decoration:
                      InputDecoration.collapsed(hintText: '(416) 123-4567'),
                  onPhoneNumberChange: onPhoneNumberChange,
                  initialPhoneNumber: phoneNumber,
                  initialSelection: 'SA',
                  showCountryCodes: true,
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: TextFormField(
              //     keyboardType: TextInputType.phone,
              //     cursorColor: ktextcolor,
              //     controller: phoneController,
              //     validator: (value) {
              //       if (value.isEmpty) {
              //         return 'رقم الجوال خطاء';
              //       }
              //       return null;
              //     },
              //     onSaved: (value) {
              //       setState(() {
              //         _phone = value;
              //       });
              //     },
              //     style: TextStyle(
              //       fontFamily: 'Cairo',
              //       fontSize: getProportionateScreenWidth(16),
              //     ),
              //     textAlign: TextAlign.right,
              //     decoration: InputDecoration(
              //       hintText: '05000999449',
              //       labelStyle: TextStyle(
              //         fontFamily: 'Cairo',
              //         fontSize: getProportionateScreenWidth(18),
              //       ),
              //       labelText: 'رقم الجوال',
              //     ),
              //   ),
              // ),
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
                            getTranslated(context, 'sure'),
                            style: TextStyle(
                                color: kraisedbuttoncolor,
                                fontSize: getProportionateScreenWidth(18),
                                fontFamily: 'Cairo'),
                          ),
                          onPressed: () {
                            // print(verificationId);
                            //_submitForm();

                            if (phoneNumber != null) {
                              print('Done');

                              _submitForm();
                              print(phoneNumber);
                              print(phone22);

                              // Navigator.pushNamed(context, OTPScreen.routeName,
                              //     arguments: {"number": phoneNumber});
                              // verifyPhone(phoneNumber).then((value) => verifyOTP);
                              // verifyOTP(verificationCode);
                              // print(verificationCode);
                              // Navigator.pushNamed(
                              //   context,
                              //   OPtScreen.routeName,
                              //   arguments: {
                              //     'phone': phoneNumber,
                              //     'vs': verificationId,
                              //   },
                              // );
                            } else {
                              print(massage = "Failed");
                            }
                          },
                        ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
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
            ],
          ),
        ),
      ),
    );
  }
}
