

import 'package:dio/dio.dart';
import 'package:mlahem/Models/new_users_model.dart';
import 'package:mlahem/network/Network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewusersController {
  NetWork netWork = NetWork();
  NewuserModel _newuserModel = NewuserModel();
  Future<Map<String, dynamic>> newuser({String name,String phone,String password,String password_confirmation}) async{
    FormData formData = FormData.fromMap({
      "name": name,
      "phone": phone,
      "password":password,
      "password_confirmation":password_confirmation
    });

   var response = await netWork.postData(url:'/auth/register',formData: formData);
   print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'incorrect',
        "success": false,
      };
    } else if (response == 'internet') {
      return {
        "result": null,
        "err": 'no internet connection',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": null,
        "err": 'incorrect',
        "success": false,
      };
    } else if (response['success']) {
      _newuserModel = NewuserModel.fromJson(response);
    print(_newuserModel);

      return {
        "result": _newuserModel.message,
        "err":_newuserModel.success,
        "success": true,
      };
    } else {
      return {
        "result": _newuserModel.message,
        "err": _newuserModel.success,
        "success": false,
      };
    }
  }
}
