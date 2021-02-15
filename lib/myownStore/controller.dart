import 'package:mlahem/Models/my_own_store.dart';
import 'package:mlahem/network/Network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyownStoreController {
  NetWork _netWork = NetWork();

  MyownStoreModel _myownStoreModel = MyownStoreModel();

  Future<MyownStoreModel> getmyowenStore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      {'Authorization': prefs.getString('token')}
    ];
    var data = await _netWork.getData(url: 'my-own-stores', headers: _headers);
    _myownStoreModel = MyownStoreModel.fromJson(data);
    return _myownStoreModel;
  }
}
