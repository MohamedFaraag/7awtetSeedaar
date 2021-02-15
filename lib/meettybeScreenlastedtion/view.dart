// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:mlahem/Models/meet_tybe_model.dart';
// import 'package:mlahem/configrations/size_config.dart';
// import 'package:mlahem/configrations/them_config.dart';
// import 'package:mlahem/language/Local_localization.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// int catid = 32;
// String mass;
// // ignore: unused_element
// // MeettybeController _meettybeController = MeettybeController();
// // ignore: unused_element
// MeettybeModel _meetybeModel;
// // MeettybesStoreModel _meettybesStoreModel = MeettybesStoreModel();
// // MeettybeStoreController _meettybeStoreController = MeettybeStoreController();

// bool _loading = false;

// class MeettybeScreenLastEdtion extends StatefulWidget {
//   static String routeName = '/MeettybeScreenLastEdtion';

//   @override
//   _MeettybeScreenLastEdtionState createState() =>
//       _MeettybeScreenLastEdtionState();
// }

// class _MeettybeScreenLastEdtionState extends State<MeettybeScreenLastEdtion> {
//   Future<MeettybeModel> getJsonData(int id) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(prefs.getString('token'));
//     List<Map<String, dynamic>> _headers = [
//       {
//         'Authorization': prefs.getString('token')
//         // 'Authorization':
//         //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGVtby5hc29sLXRlYy5jb21cL2hlZWRlclwvcHVibGljXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjA3MDE0Mjc5LCJuYmYiOjE2MDcwMTQyNzksImp0aSI6IkxjQVlWN3JtUEtDdmFPSjYiLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.YLEh6pPqbvGw-rbYiUABziHdy4Z30eHU_J_u7bZSHbg'
//       }
//     ];
//     // setState(() {
//     //   _loading = true;
//     // });

//     final String url =
//         'https://demo.asol-tec.com/heeder/public/api/stores-meet-types/$id';

//     var response = await get(Uri.encodeFull(url), headers: {
//       'Authorization': 'Bearer ${_headers[0]}',
//     });
//     print(url);

//     setState(() {
//       var convertJason = json.decode(response.body);
//       _meetybeModel = MeettybeModel.fromJson(convertJason);
//       print('Get Data');
//       print(_meetybeModel.meetTypes.data[0].id);
//     });
//   }

//   // void _getmeet(BuildContext context, int id) async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   print(prefs.getString('token'));

//   //   Response response = await Dio().get(
//   //     "https://demo.asol-tec.com/heeder/public/api/stores-meet-types/$id",
//   //     options: Options(
//   //       headers: {'Authorization': prefs.getString('token')},
//   //     ),
//   //   );

//   //   // response.data = json.decode();
//   //   print(response.data['meetTypes']);
//   // }
//   // _getmeet(BuildContext context, id) async {
//   //   _meetybeModel = await _meettybeStoreController.getmeettybe(id);
//   //   setState(() {
//   //     _loading = false;
//   //   });
//   // }
//   // @override
//   // void dispose() {
//   //   catid;
//   //   super.dispose();
//   // }

//   // getmeettybe() async {
//   //   _meettybesStoreModel = await _meettybeStoreController.getmeettybe(catid);

//   //   int id = _meettybesStoreModel.meetTypes.data[0].storeId;

//   //   print(catid);
//   //   setState(() {
//   //     _loading = false;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final routeArg =
//         ModalRoute.of(context).settings.arguments as Map<String, Object>;
//     setState(() {
//       catid = routeArg['id'];
//     });
//     print(catid);
//     String catName = routeArg['name'];
//     print(catName);
//     String cataddress = routeArg['address'];
//     String catimage = routeArg['image'];
//     int catView = routeArg['views'];
//     bool catFav = routeArg['Fav'];
//     print(catFav);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.green),
//       ),
//       body: !_loading
//           ? SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: Center(
//                       child: Image.network(catimage),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: getProportionateScreenWidth(20),
//                         ),
//                         Image.asset('assets/images/eye.png'),
//                         Text(
//                           catView.toString(),
//                         ),
//                         SizedBox(
//                           width: getProportionateScreenWidth(100),
//                         ),
//                         Container(
//                           child: Row(
//                             children: [
//                               Icon(Icons.favorite,
//                                   size: 30,
//                                   color: catFav == true
//                                       ? Colors.red
//                                       : Colors.grey),
//                               SizedBox(
//                                 width: getProportionateScreenWidth(50),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       catName,
//                       style: TextStyle(
//                           fontSize: getProportionateScreenWidth(18),
//                           fontFamily: 'Cairo',
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: getProportionateScreenWidth(10),
//                       ),
//                       Icon(
//                         Icons.place,
//                       ),
//                       Text(
//                         cataddress,
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(16),
//                             fontFamily: 'Cairo',
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: getProportionateScreenHeight(5),
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           getTranslated(context, 'meet'),
//                           style: TextStyle(
//                               fontFamily: 'Cairo',
//                               fontSize: getProportionateScreenWidth(18),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: ktextcolor,
//                     thickness: 2,
//                   ),
//                   // _meettybesStoreModel.meetTypes.data.isEmpty
//                   //     ? Center(
//                   //         child: Text(getTranslated(context, 'errormassage')),
//                   //       )
//                   //     : Column(
//                   //         children: _meettybesStoreModel.meetTypes.data
//                   //             .map(
//                   //               (item) => Card(
//                   //                 elevation: 1,
//                   //                 child: Row(
//                   //                   mainAxisAlignment:
//                   //                       MainAxisAlignment.start,
//                   //                   children: [
//                   //                     ClipRRect(
//                   //                       borderRadius:
//                   //                           BorderRadius.circular(10),
//                   //                       child: Container(
//                   //                         color: Colors.black,
//                   //                         height:
//                   //                             getProportionateScreenHeight(
//                   //                                 100),
//                   //                         width: getProportionateScreenWidth(
//                   //                             100),
//                   //                         child: Image.network(
//                   //                           item.image,
//                   //                           fit: BoxFit.cover,
//                   //                         ),
//                   //                       ),
//                   //                     ),
//                   //                     Column(
//                   //                       crossAxisAlignment:
//                   //                           CrossAxisAlignment.start,
//                   //                       mainAxisAlignment:
//                   //                           MainAxisAlignment.spaceAround,
//                   //                       children: [
//                   //                         Row(
//                   //                           children: [
//                   //                             Text(
//                   //                               getTranslated(
//                   //                                   context, 'tybeName'),
//                   //                               style: TextStyle(
//                   //                                   fontSize:
//                   //                                       getProportionateScreenWidth(
//                   //                                           14),
//                   //                                   fontFamily: 'Cairo',
//                   //                                   fontWeight:
//                   //                                       FontWeight.w600),
//                   //                             ),
//                   //                             Padding(
//                   //                               padding: EdgeInsets.all(6),
//                   //                               child: Text(
//                   //                                 "${item.meetType}",
//                   //                                 style: TextStyle(
//                   //                                     fontSize:
//                   //                                         getProportionateScreenWidth(
//                   //                                             10),
//                   //                                     fontFamily: 'Cairo',
//                   //                                     fontWeight:
//                   //                                         FontWeight.w600),
//                   //                               ),
//                   //                             ),
//                   //                           ],
//                   //                         ),
//                   //                         Row(
//                   //                           children: [
//                   //                             Text(
//                   //                               getTranslated(
//                   //                                   context, 'kill'),
//                   //                               style: TextStyle(
//                   //                                   fontSize:
//                   //                                       getProportionateScreenWidth(
//                   //                                           10),
//                   //                                   fontFamily: 'Cairo',
//                   //                                   fontWeight:
//                   //                                       FontWeight.w600),
//                   //                             ),
//                   //                             Padding(
//                   //                               padding: EdgeInsets.all(6),
//                   //                               child: Text(
//                   //                                 "${item.slaughterDate}",
//                   //                                 style: TextStyle(
//                   //                                     fontSize:
//                   //                                         getProportionateScreenWidth(
//                   //                                             10),
//                   //                                     fontFamily: 'Cairo',
//                   //                                     fontWeight:
//                   //                                         FontWeight.w600),
//                   //                               ),
//                   //                             ),
//                   //                           ],
//                   //                         ),
//                   //                         Row(
//                   //                           children: [
//                   //                             Text(
//                   //                               getTranslated(context, 'age'),
//                   //                               style: TextStyle(
//                   //                                   fontSize:
//                   //                                       getProportionateScreenWidth(
//                   //                                           10),
//                   //                                   fontFamily: 'Cairo',
//                   //                                   fontWeight:
//                   //                                       FontWeight.w600),
//                   //                             ),
//                   //                             Padding(
//                   //                               padding: EdgeInsets.all(6),
//                   //                               child: Text(
//                   //                                 "${item.age}",
//                   //                                 style: TextStyle(
//                   //                                     fontSize:
//                   //                                         getProportionateScreenWidth(
//                   //                                             10),
//                   //                                     fontFamily: 'Cairo',
//                   //                                     fontWeight:
//                   //                                         FontWeight.w600),
//                   //                               ),
//                   //                             ),
//                   //                           ],
//                   //                         ),
//                   //                         // SizedBox(
//                   //                         //   width: getProportionateScreenWidth(200),
//                   //                         // ),
//                   //                         // FloatingActionButton(
//                   //                         //   backgroundColor: Colors.green[500],
//                   //                         //   onPressed: () =>
//                   //                         //       launch('tel://01208860796'),
//                   //                         //   child: Icon(Icons.call),
//                   //                         // ),
//                   //                       ],
//                   //                     ),
//                   //                   ],
//                   //                 ),
//                   //               ),
//                   //             )
//                   //             .toList(),
//                   //       ),
//                 ],
//               ),
//             )
//           : Center(
//               child: Container(
//                 width: 70.0,
//                 height: 70.0,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   // void fav(int curentid) async {
//   //   setState(() {
//   //     showLoaderDialog(context);
//   //   });

//   //   Map<String, dynamic> _result = await _addFavController.addFav(id: curentid);
//   //   print('Fav');

//   //   if (_result['success']) {
//   //     print('Response Done');
//   //     print(_result);
//   //     print(curentid);
//   //     Navigator.pop(context);
//   //     //getmeettybe();
//   //   } else {
//   //     print('Failed');
//   //   }
//   // }

//   // void unFav(int curentid) async {
//   //   setState(() {
//   //     showLoaderDialog(context);
//   //   });

//   //   Map<String, dynamic> _result =
//   //       await _deletFavController.delFav(id: curentid);
//   //   print('unFav');
//   //   if (_result['success']) {
//   //     print('Response Done');
//   //     print(_result);
//   //     print(curentid);
//   //     Navigator.pop(context);
//   //     //getmeettybe();
//   //   } else {
//   //     print('Failed');
//   //   }
//   // }

//   // showLoaderDialog(BuildContext context) {
//   //   Widget circel = Center(child: CircularProgressIndicator());

//   //   showDialog(
//   //     barrierDismissible: false,
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return circel;
//   //     },
//   //   );
//   // }

//   @override
//   void initState() {
//     getJsonData(catid);
//     super.initState();
//   }
// }
