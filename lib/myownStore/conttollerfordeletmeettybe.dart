import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlahem/Models/del_meet_tybe.dart';
import 'package:mlahem/network/Network.dart';

class Deletmeettybe {
  NetWork netWork = NetWork();

  DeletMeettybeModel _deletMeettybeModel = DeletMeettybeModel();

  Future<Map<String, dynamic>> delMeettybe({int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _headers = [
      {'Authorization': prefs.getString('token')}
    ];

    var response =
        await netWork.deleteData(url: 'meet_types/$id', headers: _headers);
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
      _deletMeettybeModel = DeletMeettybeModel.fromJson(response);
      return {
        "result": _deletMeettybeModel.message,
        "err": _deletMeettybeModel.message,
        "success": true,
      };
    }
    return {
      "result": _deletMeettybeModel.message,
      "err": _deletMeettybeModel.message,
      "success": false,
    };
  }
}
