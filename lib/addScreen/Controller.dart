// import 'package:dio/dio.dart';
// import 'package:mlahem/Models/add_Store_model.dart';
// import 'package:mlahem/network/Network.dart';

// class AddStoreController {
//   NetWork netWork = NetWork();

//   // ignore: unused_field
//   AddStoremodel _addStoremodel = AddStoremodel();

//   // ignore: missing_return
//   Future<Map<String, dynamic>> addData({
//     String name,
//     String phone,
//     String address,
//   }) async {
//     FormData formData =
//         FormData.fromMap({"name": name, "phone": phone, "address": address});
//     var response = await netWork.postData(url: 'stores', formData: formData);
//     print(response);
//     if (response == 'not found') {
//       return {
//         "result": null,
//         "err": 'password or user name incorrect',
//         "success": false,
//       };
//     } else if (response == 'internet') {
//       return {
//         "result": null,
//         "err": 'no internet connection',
//         "success": false,
//       };
//     } else if (response == null) {
//       return {
//         "result": null,
//         "err": 'password or user name incorrect',
//         "success": false,
//       };
//     } else if (response['success']) {
//       _addStoremodel = AddStoremodel.fromJson(response);

//       return {
//         "result": _addStoremodel.data,
//         "err": _addStoremodel.message,
//         "success": true,
//       };
//     } else if (response['success']) {
//       return {
//         "success": true,
//         "result": _addStoremodel.data,
//         "err": _addStoremodel.message,
//       };
//     }
//   }
// }
