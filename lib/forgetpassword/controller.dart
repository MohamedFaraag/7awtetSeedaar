import 'package:dio/dio.dart';

import 'package:mlahem/Models/update_password_model.dart';

import 'package:mlahem/network/Network.dart';

class UpdateController {
  NetWork netWork = NetWork();

  UpdatepasswordModel _updateDataModel = UpdatepasswordModel();

  // ignore: missing_return
  Future<Map<String, dynamic>> uerpass({
    String phone,
  }) async {
    FormData formData = FormData.fromMap({
      "phone": phone,
    });
    var response = await netWork.postData(
        url: '/auth/forget-password', formData: formData);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'password or user name incorrect',
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
        "err": 'password or user name incorrect',
        "success": false,
      };
    } else if (response['success']) {
      _updateDataModel = UpdatepasswordModel.fromJson(response);

      return {
        "result": _updateDataModel.data,
        "err": _updateDataModel.message,
        "success": true,
      };
    } else if (response['success'] == 'false') {
      return {
        "success": true,
        "result": _updateDataModel.data,
        "err": _updateDataModel.message,
      };
    }
  }
}
