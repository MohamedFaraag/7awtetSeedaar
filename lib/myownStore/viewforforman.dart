import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mlahem/Models/StoreScreenModel.dart';

import 'package:mlahem/Models/meet_tybe_store_model.dart';

import 'package:mlahem/StoreScreen/controllerforaddfav.dart';
import 'package:mlahem/StoreScreen/controllerfordeletfav.dart';

import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';

import 'package:mlahem/language/Local_localization.dart';

import 'package:mlahem/meetybeScreen/controller.dart';
import 'package:mlahem/meetybeScreen/controllerformeettybe.dart';

import 'package:mlahem/addmeettybe/controller.dart';
import 'package:mlahem/meetybeScreen/controllerforstoretype.dart';
import 'package:mlahem/myownStore/conttollerfordeletmeettybe.dart';
import 'package:mlahem/editmeettybe/view.dart';
import 'package:mlahem/Models/store_model.dart';
import 'package:mlahem/StoreScreen/controller.dart';
import 'package:mlahem/meetybeScreen/viewphotoscreen.dart';
import 'package:mlahem/myownStore/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

String mass;
// ignore: unused_element
MeettybeController _meettybeController = MeettybeController();
// ignore: unused_element
// MeettybeModel _meetybeModel = MeettybeModel();
MeettybesStoreModel _meettybesStoreModel = MeettybesStoreModel();
MeettybeStoreController _meettybeStoreController = MeettybeStoreController();
DeletFavController _deletFavController = DeletFavController();
StoreScreenModel _storeScreenModel = StoreScreenModel();
StoretybeScreenController _storetybeScreenController = StoretybeScreenController();
Deletmeettybe _deletmeettybe = Deletmeettybe();
AddFavController _addFavController = AddFavController();
StoreController _storeController = StoreController();
StoreModel _storeModel = StoreModel();
int catid = 0;
String _token;

bool _loading = true;

class MeettybeScreen2 extends StatefulWidget {
  static String routeName = '/meettybeScreen2';

  @override
  _MeettybeScreen2State createState() => _MeettybeScreen2State();
}

class _MeettybeScreen2State extends State<MeettybeScreen2> {
  getmeettybe() async {
    _meettybesStoreModel = await _meettybeStoreController.getmeettybe(catid);
    print(catid);
    setState(() {
      _loading = false;
    });
  }

  void initState() {
    _getToken();
    super.initState();
  }

  _getStore() async {
    _storeModel = await _storeController.getStores();
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
  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');

    });

      getmeettybe();
    _getStore();
    _getStoretybe();
  }
  @override
  Widget build(BuildContext context) {
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
    // if (_meettybesStoreModel.meetTypes == null) {

    // } else {
    //   getmeettybe();
    // }


    return Scaffold(
      appBar: AppBar(
        actions: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   GestureDetector(onTap:()=>Navigator.pushReplacementNamed(context, MyownStore.routeName),child: Icon(Icons.arrow_forward,color: Colors.green,)),
),
        ],
        elevation: 0,
        backgroundColor: Colors.white,

      ),
      body: !_loading
          ? RefreshIndicator(
              onRefresh: () => getmeettybe(),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(140),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(catimage), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          // border: Border.all(),
                        ),
                        child: null,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //   width: getProportionateScreenWidth(20),
                            // ),
                            Image.asset('assets/images/eye.png'),
                            Text(
                              catView.toString(),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(150),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _storeScreenModel
                                        .data.favorite ==
                                        true
                                        ? _token != null
                                        ? unFav(_storeScreenModel
                                        .data.id)
                                        : showMyDialog(context)
                                        : _token != null
                                        ? fav(_storeScreenModel
                                        .data.id)
                                        : showMyDialog(context),
                                    child: Icon(Icons.favorite,
                                        size: 30,
                                        color: _storeScreenModel
                                            .data.favorite
                                            ? Colors.red
                                            : Colors.grey),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(50),
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
                          catName,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Icon(
                            Icons.place,
                          ),
                          Text(
                            cataddress,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(5),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              getTranslated(context, 'meet'),
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: getProportionateScreenWidth(16),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                      child: Text(
                                        getTranslated(context, 'add2'),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF1C7D35),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pushNamed(
                                        context,
                                        AddMeettybeController.routeName,
                                        arguments: {"id": catid},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              child: Icon(Icons.settings),
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: ktextcolor,
                        thickness: 2,
                      ),
                      _meettybesStoreModel.meetTypes.data.isEmpty
                          ? Center(
                              child:
                                  Text(getTranslated(context, 'errormassage')),
                            )
                          : Column(
                              children: _meettybesStoreModel.meetTypes.data
                                  .map(
                                    (item) => Stack(
                                      children: [
                                        Card(
                                          elevation: 1,
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
                                                          100),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          100),
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        Navigator.pushNamed(
                                                            context,
                                                            ViewPhoto.routeName,
                                                            arguments: {
                                                          "image": catimage
                                                        }),
                                                    child: Image.network(
                                                      item.image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          getTranslated(context,
                                                              'tybeName'),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      14),
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
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
                                                                fontFamily:
                                                                    'Cairo',
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
                                                                      10),
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Text(
                                                            "${item.slaughterDate}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        10),
                                                                fontFamily:
                                                                    'Cairo',
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
                                                              context, 'age'),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      10),
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(6),
                                                          child: Text(
                                                            "${item.age}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        10),
                                                                fontFamily:
                                                                    'Cairo',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
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
                                                          context, 'editt'),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFF1C7D35),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      print('edit');
                                                      Navigator.pushNamed(
                                                        context,
                                                        EditMeettybeView
                                                            .routeName,
                                                        arguments: {
                                                          'id': item.id,
                                                          'image': item.image,
                                                          'name': item.meetType,
                                                          "age": item.age,
                                                          "date":
                                                              item.slaughterDate
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  CupertinoActionSheetAction(
                                                    child: Text(
                                                      getTranslated(
                                                          context, 'rem'),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFFD21818),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    onPressed: () =>
                                                        deldata(item.id),
                                                  ),
                                                  CupertinoActionSheetAction(
                                                    child: Text(
                                                      getTranslated(
                                                          context, 'addbutton'),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFF1C7D35),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.pushNamed(
                                                      context,
                                                      AddMeettybeController
                                                          .routeName,
                                                      arguments: {"id": catid},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.settings,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                    ],
                  );
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
      getmeettybe();
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
      getmeettybe();
    } else {
      print('Failed');
    }
  }

  void deldata(int curentid) async {
    setState(() {
      showLoaderDialog(context);
    });

    Map<String, dynamic> _result =
        await _deletmeettybe.delMeettybe(id: curentid);
    print('unFav');
    if (_result['success']) {
      print('Response Done');
      print(_result);
      print(curentid);
      showMyDialog2(context);
      Navigator.of(context);
      getmeettybe();
      Navigator.pop(context);
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
            getTranslated(context, 'done'),
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
                Navigator.of(context);
              },
            ),
          ],
        );
      },
    );
  }
}
