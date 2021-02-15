import 'package:mlahem/Models/delete_store_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mlahem/network/Network.dart';

class DeletStoreController {
  NetWork netWork = NetWork();

  DeleteStoreModel _deleteStoreModel = DeleteStoreModel();

  Future<Map<String, dynamic>> delStore({int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _headers = [
      {
        'Authorization': prefs.getString('token')
        // 'Authorization':
        //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MDE0Mjc5LCJuYmYiOjE2MDcwMTQyNzksImp0aSI6IkxjQVlWN3JtUEtDdmFPSjYiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.YLEh6pPqbvGw-rbYiUABziHdy4Z30eHU_J_u7bZSHbg'
      }
    ];

    var response =
        await netWork.deleteData(url: 'stores/$id', headers: _headers);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'Failed',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": null,
        "err": 'Failed',
        "success": false,
      };
    } else if (response['success']) {
      _deleteStoreModel = DeleteStoreModel.fromJson(response);
      return {
        "result": _deleteStoreModel.message,
        "err": _deleteStoreModel.message,
        "success": true,
      };
    }
    return {
      "result": _deleteStoreModel.message,
      "err": _deleteStoreModel.message,
      "success": false,
    };
  }
}
