
import 'package:flutter/material.dart';

import 'package:mlahem/FavScreen/view.dart';
import 'package:mlahem/PageView/view.dart';
import 'package:mlahem/Screens/ClientScreen.dart';
import 'package:mlahem/Screens/ClientScreen2.dart';
import 'package:mlahem/Screens/HomeScreen.dart';
import 'package:mlahem/Screens/SettingScreen.dart';
import 'package:mlahem/Screens/SettingScreenForMan.dart';
import 'package:mlahem/Screens/splashScreen.dart';
import 'package:mlahem/StoreScreen/view.dart';
import 'package:mlahem/addScreen/View.dart';
import 'package:mlahem/editScreen/view.dart';
import 'package:mlahem/forgetpassword/view.dart';
import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/login/newusersView.dart';
import 'package:mlahem/meetybeScreen/view.dart';
import 'package:mlahem/myownStore/view.dart';
import 'package:mlahem/myownStore/viewforforman.dart';
import 'package:mlahem/setting/aboutappScreen.dart';
import 'package:mlahem/setting/changeLangScreen.dart';
import 'package:mlahem/setting/condtionScreen.dart';
import 'package:mlahem/setting/mailScreen.dart';
import 'package:mlahem/widgets/customTapBar.dart';
import 'package:mlahem/widgets/customTapBar2.dart';
import 'package:mlahem/widgets/tegWidget.dart';
import 'package:mlahem/addmeettybe/view.dart';
import 'package:mlahem/addmeettybe/controller.dart';
import 'package:mlahem/editmeettybe/view.dart';
import 'package:mlahem/newpassword/updatePassword.dart';
import 'package:mlahem/Screens/mailScreen2.dart';
import 'package:mlahem/meetybeScreen/viewphotoscreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  AddStoreView.routeName: (context) => AddStoreView(),
  MainTapbarr2.routeName: (context) => MainTapbarr2(),
  ClientScreen.routeName: (context) => ClientScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  FavScreenview.routeName: (context) => FavScreenview(),
  StoreScreen.routeName: (context) => StoreScreen(),
  LanguageScreen.routeName: (context) => LanguageScreen(),
  Pview.routeName: (context) => Pview(),
  MeettybeScreen.routeName: (context) => MeettybeScreen(),
  TegEidget.routeName: (context) => TegEidget(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  MainTapbarr.routeName: (context) => MainTapbarr(),
  ClientScreen2.routeName: (context) => ClientScreen2(),
  AboutApp.routeName: (context) => AboutApp(),
  UserCondtion.routeName: (context) => UserCondtion(),
  MailScreen.routeName: (context) => MailScreen(),
  SettingsFormanScreen.routeName: (context) => SettingsFormanScreen(),
  MyownStore.routeName: (context) => MyownStore(),
  EditScreenView.routeName: (context) => EditScreenView(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  MeettybeScreen2.routeName: (context) => MeettybeScreen2(),
  MeetTybeViewForman.routeName: (context) => MeetTybeViewForman(),
  AddMeettybeController.routeName: (context) => AddMeettybeController(),
  EditMeettybeView.routeName: (context) => EditMeettybeView(),
  // UpdatePasswordScreen.routeName: (context) => UpdatePasswordScreen(),
  MailScreen2.routeName: (context) => MailScreen2(),
  SplScreen.routeName: (context) => SplScreen(),
  ViewPhoto.routeName: (context) => ViewPhoto(),
  NewUsersView.routeName:(context)=>NewUsersView(),
  //MeettybeScreenLastEdtion.routeName: (context) => MeettybeScreenLastEdtion(),
};
