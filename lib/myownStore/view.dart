import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlahem/Models/my_own_store.dart';
import 'package:mlahem/widgets/customTapBar2.dart';

import 'package:mlahem/StoreScreen/controllerforaddfav.dart';
import 'package:mlahem/StoreScreen/controllerfordeletfav.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/editScreen/view.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/myownStore/contollerfordelet.dart';
import 'package:mlahem/myownStore/controller.dart';
import 'package:mlahem/myownStore/viewforforman.dart';

class MyownStore extends StatefulWidget {
  static String routeName = '/MyownStore';

  @override
  _MyownStoreState createState() => _MyownStoreState();
}

class _MyownStoreState extends State<MyownStore> {
  bool _loading = true;
  MyownStoreModel _myownStoreModel = MyownStoreModel();
  MyownStoreController _myownStoreController = MyownStoreController();
  AddFavController _addFavController = AddFavController();
  DeletFavController _deletFavController = DeletFavController();
  DeletStoreController _deletStoreController = DeletStoreController();

  //List<storeInnerData> innerList = [];
  //String role, token;
  //bool loading = false;
  //bool loadMore = false;
  // StoresModel _storesModel;
  // int currentStoppedPage = 1;
  // ItemScrollController _scrollController = ItemScrollController();
  //ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    _getmyowenStore();
  }

  _getmyowenStore() async {
    _myownStoreModel = await _myownStoreController.getmyowenStore();
    setState(() {
      _loading = false;
    });
    // fav(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            //alignment: Alignment(0, 0),
            child: Text(
              getTranslated(context, 'ownstroe'),
              style: TextStyle(
                  color: ktextcolor,
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo'),
            ),
          ),
        ),
      ),
      body: !_loading
          ? RefreshIndicator(
              onRefresh: () => _getmyowenStore(),
              //getJsonData(currentStoppedPage),
              child: _myownStoreModel.myOwnStore[0].data.isEmpty
                  ? Center(
                      child: Text(
                        getTranslated(context, 'errormassage'),
                      ),
                    )
                  : Stack(
                      children: [
                        NotificationListener(
                          child: ListView.builder(
                            itemCount:
                                _myownStoreModel.myOwnStore[0].data.length,
                            // itemScrollController: _scrollController,
                            // itemPositionsListener: itemPositionsListener,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(40),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pushReplacementNamed(
                                      context,
                                      MeettybeScreen2.routeName,
                                      arguments: {
                                        'id': _myownStoreModel
                                            .myOwnStore[0].data[index].id,
                                        'name': _myownStoreModel
                                            .myOwnStore[0].data[index].name,
                                        'address': _myownStoreModel
                                            .myOwnStore[0].data[index].address,
                                        'views': _myownStoreModel
                                            .myOwnStore[0].data[index].views,
                                        'image': _myownStoreModel
                                            .myOwnStore[0].data[index].image,
                                        'Fav': _myownStoreModel
                                            .myOwnStore[0].data[index].favorite,
                                        'phone': _myownStoreModel
                                            .myOwnStore[0].data[index].phone
                                      },
                                    ),
                                    child: Stack(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                                        140),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          _myownStoreModel
                                                              .myOwnStore[0]
                                                              .data[index]
                                                              .image),
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
                                                      _myownStoreModel
                                                          .myOwnStore[0]
                                                          .data[index]
                                                          .views
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
                                                            onTap: () => _myownStoreModel
                                                                        .myOwnStore[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .favorite ==
                                                                    true
                                                                ? unFav(_myownStoreModel
                                                                    .myOwnStore[
                                                                        0]
                                                                    .data[index]
                                                                    .id)
                                                                : fav(_myownStoreModel
                                                                    .myOwnStore[
                                                                        0]
                                                                    .data[index]
                                                                    .id),
                                                            child: Icon(
                                                                Icons.favorite,
                                                                size: 30,
                                                                color: _myownStoreModel
                                                                            .myOwnStore[
                                                                                0]
                                                                            .data[
                                                                                index]
                                                                            .favorite ==
                                                                        true
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .grey),
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
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  _myownStoreModel.myOwnStore[0]
                                                      .data[index].name,
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              18),
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            10),
                                                  ),
                                                  Icon(
                                                    Icons.place,
                                                  ),
                                                  Text(
                                                    _myownStoreModel
                                                        .myOwnStore[0]
                                                        .data[index]
                                                        .address,
                                                    style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                16),
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () =>
                                                showCupertinoModalPopup(
                                                    context: context,
                                                    builder: (context) =>
                                                        CupertinoActionSheet(
                                                          actions: [
                                                            CupertinoActionSheetAction(
                                                              child: Text(
                                                                getTranslated(
                                                                    context,
                                                                    'editt'),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Color(
                                                                      0xFF1C7D35),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                print('تعديل');
                                                                Navigator
                                                                    .pushNamed(
                                                                  context,
                                                                  EditScreenView
                                                                      .routeName,
                                                                  arguments: {
                                                                    'id': _myownStoreModel
                                                                        .myOwnStore[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .id,
                                                                    'name': _myownStoreModel
                                                                        .myOwnStore[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .name,
                                                                    'phone': _myownStoreModel
                                                                        .myOwnStore[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .phone,
                                                                    'address': _myownStoreModel
                                                                        .myOwnStore[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .address,
                                                                    'image': _myownStoreModel
                                                                        .myOwnStore[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .image
                                                                  },
                                                                );

                                                                // },
                                                              },
                                                            ),
                                                            CupertinoActionSheetAction(
                                                              child: Text(
                                                                getTranslated(
                                                                    context,
                                                                    'rem'),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Color(
                                                                      0xFFD21818),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              onPressed: () => delStore(
                                                                  _myownStoreModel
                                                                      .myOwnStore[
                                                                          0]
                                                                      .data[
                                                                          index]
                                                                      .id),
                                                            ),
                                                          ],
                                                        )),
                                            child: Container(
                                              
                                              decoration:BoxDecoration(
                              color: Colors.grey,
                                                borderRadius: BorderRadius.circular(20)
                              ),
                                              child: Icon(
                                                Icons.more_vert,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          // onNotification: (ScrollNotification scrollInfo) {
                          //   if (!_loading &&
                          //       _storeModel.storeData[0].data.length <=
                          //           _storeModel.storeData[0].total &&
                          //       _storeModel.storeData[0].currentPage <
                          //           _storeModel.storeData[0].lastPage &&
                          //       scrollInfo.metrics.pixels ==
                          //           scrollInfo.metrics.maxScrollExtent) {
                          // getJsonData(currentStoppedPage + 1);
                          // setState(() {
                          //   loadMore = true;
                          // });
                          //}
                          //}),
                          // // loadMore == true
                          //     ? Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //
                          //    : Container() MainTapbarr(),
                        ),
                      ],
                    ))
          : Center(
              child: Container(
                width: 70.0,
                height: 70.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
    );
  }

  void delStore(int idd) async {
    setState(() {
      showLoaderDialog(context);
    });
    Map<String, dynamic> _result =
        await _deletStoreController.delStore(id: idd);
    print('delStore');
    if (_result['success']) {
      print('Response Done');
      print(_result);
      print(idd);
      showMyDialog2(context);
      // setState(() {
      //   _getmyowenStore();
      //   Navigator.pop(context);
      // });
    } else {
      print('Failed');
    }
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
      _getmyowenStore();
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
      _getmyowenStore();
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

  Future<void> showMyDialog2(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            getTranslated(context, 'done3'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              fontSize: getProportionateScreenWidth(18),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                getTranslated(context, 'ex'),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, MainTapbarr2.routeName);
              },
            ),
          ],
        );
      },
    );
  }
}
