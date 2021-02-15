import 'package:flutter/material.dart';
import 'package:mlahem/Models/StoreScreenModel.dart';
import 'package:mlahem/Models/clonecontroller.dart';
import 'package:mlahem/Models/clonestore.dart';

import 'package:mlahem/Models/meet_tybe_store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mlahem/StoreScreen/controllerforaddfav.dart';
import 'package:mlahem/StoreScreen/controllerfordeletfav.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:mlahem/language/Local_localization.dart';

import 'package:mlahem/meetybeScreen/controller.dart';
import 'package:mlahem/meetybeScreen/controllerformeettybe.dart';
import 'package:mlahem/meetybeScreen/controllerforstoretype.dart';
import 'package:mlahem/widgets/customTapBar.dart';
import 'package:mlahem/widgets/customTapBar2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlahem/StoreScreen/controller.dart';
import 'package:mlahem/login/LoginScreenView.dart';
import 'package:mlahem/meetybeScreen/viewphotoscreen.dart';
import 'package:mlahem/Models/store_model.dart';

String mass;
// ignore: unused_element
MeettybeController _meettybeController = MeettybeController();
// ignore: unused_element
// MeettybeModel _meetybeModel = MeettybeModel();
MeettybesStoreModel _meettybesStoreModel = MeettybesStoreModel();
MeettybeStoreController _meettybeStoreController = MeettybeStoreController();
DeletFavController _deletFavController = DeletFavController();
StoreController _storeController = StoreController();
StoreScreenModel _storeScreenModel = StoreScreenModel();
StoretybeScreenController _storetybeScreenController = StoretybeScreenController();
// StoreController2 _storeController2 =StoreController2();
StoreModel _storeModel = StoreModel();
// StoreModel2 _storeModel2=StoreModel2();
AddFavController _addFavController = AddFavController();
String _token;
int catid = 0;
String _role;



bool _loading = true;

class MeettybeScreen extends StatefulWidget {
  static String routeName = '/meettybeScreen';

  @override
  _MeettybeScreenState createState() => _MeettybeScreenState();
}

class _MeettybeScreenState extends State<MeettybeScreen> {
  getmeettybe() async {
    _meettybesStoreModel = await _meettybeStoreController.getmeettybe(catid);
    print(catid);
    setState(() {
      _loading = false;
    });
  }
  _getStoretybe() async {
    _storeScreenModel = await _storetybeScreenController.getStoretype(catid);
    print(catid);
    setState(() {
      _loading = false;
    });
  }
  void initState() {
// _getStore();
    _getToken();

    super.initState();
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      _role = prefs.getString('role');
    });
    _getStoretybe();
    getmeettybe();
  }

  // _getStore() async {
  //   _storeModel= await _storeController.getStores();
  //   setState(() {
  //     _loading = false;
  //   });
  //   // fav(0);
  // }

  @override
  Widget build(BuildContext context) {
    print(_role);
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    // ignore: unused_local_variable
    setState(() {
      catid = routeArg['id'];

    });
    String catName = routeArg['name'];
    String cataddress = routeArg['address'];
    String catimage = routeArg['image'];
    int catView = routeArg['views'];
    bool catFav = routeArg['Fav'];

    int catphone = routeArg['phone'];
    // if (_meettybesStoreModel.meetTypes == null) {
    //   // getmeettybe();
    //    // _getStore();
    // } else {
    //   // getmeettybe();
    //   //   _getStore();
    // }
    return Scaffold (

      appBar: AppBar (
        elevation: 0,
        backgroundColor: Colors.white,

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(child: Icon(Icons.arrow_forward,color: Colors.green,),onTap:() =>_role=='admin'? Navigator.pushReplacementNamed(context, MainTapbarr2.routeName):Navigator.pushReplacementNamed(context, MainTapbarr.routeName)),
          )
        ],
      ),
      body: !_loading
          ? RefreshIndicator(
              onRefresh: () => getmeettybe(),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Stack(
                    children:[ Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                 Container(
                                    height:
                                    getProportionateScreenHeight(
                                        160),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            catimage
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      color: Colors.white,
                                      // border: Border.all(),
                                    ),
                                    child: null,
                                    // Image.network(
                                    //   _storeModel.storeData[0]
                                    //       .data[index].image,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),

                                Container(
                                  padding: EdgeInsets.all(6),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      // SizedBox(
                                      //   width:
                                      //       getProportionateScreenWidth(
                                      //           20),
                                      // ),
                                      Image.asset(
                                          'assets/images/eye.png'),
                                      Text(
                                        catView
                                            .toString(),
                                      ),
                                      SizedBox(
                                        width:
                                        getProportionateScreenWidth(
                                            150),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => catFav==
                                                  true
                                                  ? _token != null
                                                  ? unFav(catid)
                                                  : showMyDialog(
                                                  context)
                                                  : _token != null
                                                  ? fav(catid)
                                                  : showMyDialog(
                                                  context),
                                              child: Icon(
                                                  Icons.favorite,
                                                  size: 30,
                                                  color: catFav ==
                                                      true
                                                      ? Colors.red
                                                      : Colors.grey),
                                            ),
                                            SizedBox(
                                              width:
                                              getProportionateScreenWidth(
                                                  50),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //space
                                Container(
                                  padding: EdgeInsets.all(6),
                                  child: Text(
                                    catName,
                                    style: TextStyle(
                                        fontSize:
                                        getProportionateScreenWidth(
                                            16),
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width:
                                      getProportionateScreenWidth(
                                          5),
                                    ),
                                    Icon(
                                      Icons.place,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(6.0),
                                      child: Text(
                                        cataddress,
                                        style: TextStyle(
                                            fontSize:
                                            getProportionateScreenWidth(
                                                15),
                                            fontFamily: 'Cairo',
                                            fontWeight:
                                            FontWeight.w600),
                                      ),
                                    ),
                                    // SizedBox(
                                    //     height:
                                    //         getProportionateScreenHeight(
                                    //             20)),
                                  ],
                                ),
                              ],
                            ),
                        ),
                         ),
                        // Container(
                        //   padding: EdgeInsets.all(12),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       SizedBox(
                        //         width: getProportionateScreenWidth(20),
                        //       ),
                        //       Image.asset('assets/images/eye.png'),
                        //       Text(
                        //         catView.toString(),
                        //       ),
                        //       SizedBox(
                        //         width: getProportionateScreenWidth(100),
                        //       ),
                        //       Container(
                        //         child: Row(
                        //           children: [
                        //             GestureDetector(
                        //               onTap: () => _storeScreenModel
                        //                   .data.favorite ==
                        //                       true
                        //                   ? _token != null
                        //                       ? unFav(_storeScreenModel
                        //                   .data.id)
                        //                       : showMyDialog(context)
                        //                   : _token != null
                        //                       ? fav(_storeScreenModel
                        //                   .data.id)
                        //                       : showMyDialog(context),
                        //               child: Icon(Icons.favorite,
                        //                   size: 30,
                        //                   color: _storeScreenModel
                        //                       .data.favorite
                        //                       ? Colors.red
                        //                       : Colors.grey),
                        //             ),
                        //             SizedBox(
                        //               width: getProportionateScreenWidth(50),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: Text(
                        //     catName,
                        //     style: TextStyle(
                        //         fontSize: getProportionateScreenWidth(18),
                        //         fontFamily: 'Cairo',
                        //         fontWeight: FontWeight.w600),
                        //   ),
                        // ),
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: getProportionateScreenWidth(10),
                        //     ),
                        //     Icon(
                        //       Icons.place,
                        //     ),
                        //     Text(
                        //       cataddress,
                        //       style: TextStyle(
                        //           fontSize: getProportionateScreenWidth(16),
                        //           fontFamily: 'Cairo',
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: getProportionateScreenHeight(5),
                        // ),
                        // Column(
                        //   children: [

                        //   ],
                        // ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                getTranslated(context, 'meet'),
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: ktextcolor,
                            thickness: 2,
                          ),
                        ),
                        _meettybesStoreModel.meetTypes.data.isEmpty
                            ? Center(
                                child:
                                    Text(getTranslated(context, 'errormassage')),
                              )
                            :

                                Column(

                                  children: _meettybesStoreModel.meetTypes.data
                                      .map(
                                        (item) => Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    color: Colors.black,
                                                    height:
                                                        getProportionateScreenHeight(
                                                            110),
                                                    width:
                                                        getProportionateScreenWidth(
                                                            100),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          Navigator.pushNamed(context,
                                                              ViewPhoto.routeName,
                                                              arguments: {
                                                            "image": item.image
                                                          }),
                                                      child: Image.network(
                                                        item.image,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            getTranslated(
                                                                context, 'tybeName'),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        14),
                                                                fontFamily: 'Cairo',
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(6),
                                                            child: Text(
                                                              "${item.meetType}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      getProportionateScreenWidth(
                                                                          10),
                                                                  fontFamily: 'Cairo',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            getTranslated(
                                                                context, 'kill'),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        12),
                                                                fontFamily: 'Cairo',
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(6),
                                                            child: Text(
                                                              "${item.slaughterDate}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      getProportionateScreenWidth(
                                                                          12),
                                                                  fontFamily: 'Cairo',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            getTranslated(
                                                                context, 'age'),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        12),
                                                                fontFamily: 'Cairo',
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(6),
                                                            child: Text(
                                                              "${item.age}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      getProportionateScreenWidth(
                                                                          12),
                                                                  fontFamily: 'Cairo',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                getProportionateScreenWidth(
                                                                    80),
                                                          ),
                                                          // GestureDetector(
                                                          //   onTap: () => launch(
                                                          //       'tel://$catphone'),
                                                          //   child: Icon(
                                                          //     Icons.call,
                                                          //     color: Colors.green,
                                                          //     size: 30,
                                                          //   ),
                                                          // )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),


                      ],
                    ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(alignment: Alignment.bottomRight,height: getProportionateScreenHeight(580),child: FloatingActionButton(child:Icon(Icons.call,),backgroundColor:Colors.green, onPressed: ()=>   launch(
                        'tel://$catphone'), // GestureDetector(
                  //   onTap: () => launch(
                  //       'tel://$catphone'),
                  //   child: Icon(
                  //     Icons.call,
                  //     color: Colors.green,
                  //     size: 30,
                  //   ),
                  // ))),
                      )
                        ) )]);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void fav(int curentid) async {
    setState(() {
      showLoaderDialog(context);
    });

    Map<String, dynamic> _result = await _addFavController.addFav(id: curentid);
    print('Fav');

    if (_result['success']) {
      print('Response Done');
      print(_result);
      print(curentid);
      Navigator.pop(context);
      _getStoretybe();


    } else {
      print('Failed');
    }
  }

  void unFav(int curentid) async {
    setState(() {
      showLoaderDialog(context);
    });

    Map<String, dynamic> _result =
        await _deletFavController.delFav(id: curentid);
    print('unFav');
    if (_result['success']) {
      print('Response Done');
      print(_result);
      print(curentid);
      Navigator.pop(context);
      _getStoretybe();

    } else {
      print('Failed');
    }
  }

  showLoaderDialog(BuildContext context) {
    Widget circel = Center(child: CircularProgressIndicator());

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return circel;
      },
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            getTranslated(context, 'errorla'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          // content: Column(
          //   children: [
          //     Text(
          //       getTranslated(context, 'gofor'),
          //       style: TextStyle(
          //         fontFamily: 'Cairo',
          //         fontWeight: FontWeight.w400,
          //         fontSize: getProportionateScreenWidth(13),
          //       ),
          //     ),
          //     SizedBox(
          //       height: getProportionateScreenHeight(4),
          //     ),
          //     Text(getTranslated(context, 'apptit')),
          //   ],
          // ),
          actions: <Widget>[
            FlatButton(
              child: Text(getTranslated(context, 'ex')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(getTranslated(context, 'gofor')),
              onPressed: () => Navigator.pushReplacementNamed(
                  context, LoginScreen.routeName),
            ),
          ],
        );
      },
    );
  }
}
