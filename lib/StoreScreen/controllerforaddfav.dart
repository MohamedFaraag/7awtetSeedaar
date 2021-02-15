import 'package:dio/dio.dart';

import 'package:mlahem/Models/add_fav_model.dart';
import 'package:mlahem/network/Network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFavController {
  NetWork netWork = NetWork();

  AddFavModel _addFavModel = AddFavModel();

  Future<Map<String, dynamic>> addFav({int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _headers = [
      {
        'Authorization': prefs.getString('token')
        // 'Authorization':
        //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MDE0Mjc5LCJuYmYiOjE2MDcwMTQyNzksImp0aSI6IkxjQVlWN3JtUEtDdmFPSjYiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.YLEh6pPqbvGw-rbYiUABziHdy4Z30eHU_J_u7bZSHbg'
      }
    ];
    FormData formData = FormData.fromMap({
      "store_id": id,
    });

    var response = await netWork.postData(
        url: 'user_stores', formData: formData, headers: _headers[0]);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'Failed',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": 'error',
        "err": 'Failed',
        "success": false,
      };
    } else if (response['success']) {
      _addFavModel = AddFavModel.fromJson(response);
      return {
        "result": _addFavModel.data.id,
        "err": _addFavModel.message,
        "success": true,
      };
    }
    return {
      "result": _addFavModel.data.userId,
      "err": _addFavModel.message,
      "success": false,
    };
  }
}
