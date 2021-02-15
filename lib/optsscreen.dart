import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/editScreen/view.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:mlahem/newpassword/updatePassword.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  final String phone22;
  OTPScreen(this.phone,this.phone22);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  // final TextEditingController _pinPutController = TextEditingController();
  // final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ktext2color),
        elevation: 0,
        backgroundColor: kraisedbuttoncolor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify ${widget.phone}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    fontFamily: 'Cairo',
                    color: ktext2color),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      print('done go to for');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdatePasswordScreen(widget.phone,widget.phone22)),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState.showSnackBar(SnackBar(
                      content: Text(getTranslated(context, 'opterror'))));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePasswordScreen(widget.phone,widget.phone22),
                  ),
                  (route) => false);
              //   Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(builder: (context) => Home()),
              //       (route) => false);
            } else {
              print('erorr');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }
}
