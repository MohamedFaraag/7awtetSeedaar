import 'package:shared_preferences/shared_preferences.dart';

import 'package:mlahem/Models/delet_fav_model.dart';
import 'package:mlahem/network/Network.dart';

class DeletFavController {
  NetWork netWork = NetWork();

  DeletFavModel _deletFavModel = DeletFavModel();

  Future<Map<String, dynamic>> delFav({int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _headers = [
      {
        'Authorization': prefs.getString('token')
        // 'Authorization':
        //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MDE0Mjc5LCJuYmYiOjE2MDcwMTQyNzksImp0aSI6IkxjQVlWN3JtUEtDdmFPSjYiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.YLEh6pPqbvGw-rbYiUABziHdy4Z30eHU_J_u7bZSHbg'
      }
    ];

    var response =
        await netWork.deleteData(url: 'user_stores/$id', headers: _headers);
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
      _deletFavModel = DeletFavModel.fromJson(response);
      return {
        "result": _deletFavModel.message,
        "err": _deletFavModel.message,
        "success": true,
      };
    }
    return {
      "result": _deletFavModel.message,
      "err": _deletFavModel.message,
      "success": false,
    };
  }
}
