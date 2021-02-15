import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mlahem/Models/store_model.dart';

import 'package:mlahem/StoreScreen/controller.dart';
import 'package:mlahem/StoreScreen/controllerforaddfav.dart';
import 'package:mlahem/StoreScreen/controllerfordeletfav.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:mlahem/language/Local_localization.dart';

import 'package:mlahem/meetybeScreen/view.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlahem/login/LoginScreenView.dart';

class StoreScreen extends StatefulWidget {
  static String routeName = '/storescreen';

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool _loading = true;
  StoreModel _storeModel = StoreModel();
  StoreController _storeController = StoreController();
  AddFavController _addFavController = AddFavController();
  DeletFavController _deletFavController = DeletFavController();
  String _token;
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
    _getToken();
    _getStore();
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  _getStore() async {
    _storeModel = await _storeController.getStores();
    setState(() {
      _loading = false;
    });
    // fav(0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Text(
                    getTranslated(context, 'titlepar'),
                    style: TextStyle(
                        color: ktextcolor,
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo'),
                  ),
          ),
        ),



      body: !_loading
          ? RefreshIndicator(
              onRefresh: () => _getStore(),
              //getJsonData(currentStoppedPage),
              child: _storeModel.storeData[0].data.isEmpty
                  ? Center(
                      child: Text(
                        getTranslated(context, 'errormassage'),
                      ),
                    )
                  : Stack(
                      children: [
                        NotificationListener(
                          child: ListView.builder(
                            itemCount: _storeModel.storeData[0].data.length,
                            // itemScrollController: _scrollController,
                            // itemPositionsListener: itemPositionsListener,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pushReplacementNamed(
                                      context,
                                      MeettybeScreen.routeName,
                                      arguments: {
                                        'id': _storeModel
                                            .storeData[0].data[index].id,
                                        'name': _storeModel
                                            .storeData[0].data[index].name,
                                        'address': _storeModel
                                            .storeData[0].data[index].address,
                                        'views': _storeModel
                                            .storeData[0].data[index].views,
                                        'image': _storeModel
                                            .storeData[0].data[index].image,
                                        'Fav': _storeModel
                                            .storeData[0].data[index].favorite
                                      },
                                    ),
                                    child: Padding(
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
                                                      110),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      _storeModel.storeData[0]
                                                          .data[index].image,
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
                                                    _storeModel.storeData[0]
                                                        .data[index].views
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
                                                          onTap: () => _storeModel
                                                                      .storeData[
                                                                          0]
                                                                      .data[index]
                                                                      .favorite ==
                                                                  true
                                                              ? _token != null
                                                                  ? unFav(_storeModel
                                                                      .storeData[
                                                                          0]
                                                                      .data[index]
                                                                      .id)
                                                                  : showMyDialog(
                                                                      context)
                                                              : _token != null
                                                                  ? fav(_storeModel
                                                                      .storeData[
                                                                          0]
                                                                      .data[index]
                                                                      .id)
                                                                  : showMyDialog(
                                                                      context),
                                                          child: Icon(
                                                              Icons.favorite,
                                                              size: 30,
                                                              color: _storeModel
                                                                          .storeData[
                                                                              0]
                                                                          .data[
                                                                              index]
                                                                          .favorite ==
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
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              child: Text(
                                                _storeModel.storeData[0]
                                                    .data[index].name,
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
                                                    _storeModel.storeData[0]
                                                        .data[index].address,
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
                                  )
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
      _getStore();
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
      _getStore();
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
