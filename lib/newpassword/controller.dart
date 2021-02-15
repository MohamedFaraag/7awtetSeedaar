import 'package:dio/dio.dart';
import 'package:mlahem/network/Network.dart';
import 'package:mlahem/Models/update_pass_model.dart';

class UpdatePassController {
  NetWork netWork = NetWork();

  UpdatePass _updatePassModel = UpdatePass();

  // ignore: missing_return
  Future<Map<String, dynamic>> userpass({
    String newpass,
    String phone,
  }) async {
    FormData formData = FormData.fromMap({
      "phone": phone,
      "password": newpass,
    });
    var response =
        await netWork.postData(url: '/auth/set-password', formData: formData);
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
      _updatePassModel = UpdatePass.fromJson(response);

      return {
        "result": _updatePassModel.data,
        "err": _updatePassModel.message,
        "success": true,
      };
    } else if (response['success']) {
      return {
        "success": true,
        "result": _updatePassModel.data,
        "err": _updatePassModel.message,
      };
    }
  }
}
