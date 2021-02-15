// import 'package:mlahem/Models/clonestore.dart';
// import 'package:mlahem/Models/store_model.dart';
// import 'package:mlahem/network/Network.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class StoreController2 {
//   NetWork _netWork = NetWork();
//
//   StoreModel2 _storeModel2 = StoreModel2();
//
//   Future<StoreModel2> getIconStores() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(prefs.getString('token'));
//     List<Map<String, dynamic>> _headers = [
//       {
//         'Authorization': prefs.getString('token')
//         // 'Authorization':
//         //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MDE0Mjc5LCJuYmYiOjE2MDcwMTQyNzksImp0aSI6IkxjQVlWN3JtUEtDdmFPSjYiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.YLEh6pPqbvGw-rbYiUABziHdy4Z30eHU_J_u7bZSHbg'
//       }
//     ];
//     var data = await _netWork.getData(url: 'stores', headers: _headers);
//     _storeModel2 = StoreModel2.fromJson(data);
//     return _storeModel2;
//   }
// }
