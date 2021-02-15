import 'package:flutter/material.dart';

const ktextbuttoncolor = Color(0xFFFF9F5B);
const ktextcolor = Color(0xFF191919);
const ktext2color = Color(0xFF1C7D35);
const kheadlinecolor = Color(0xFF191919);
const kraisedbuttoncolor = Color(0xFFFFFFFF);
const specialcolor = Color(0xFFF0751F);
const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
