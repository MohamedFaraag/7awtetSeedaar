import 'package:flutter/material.dart';
import 'package:mlahem/FavScreen/controller.dart';
import 'package:mlahem/Models/fav_Store_model.dart';
import 'package:mlahem/configrations/size_config.dart';
import 'package:mlahem/configrations/them_config.dart';
import 'package:mlahem/language/Local_localization.dart';
import 'package:mlahem/meetybeScreen/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavScreenview extends StatefulWidget {
  static String routeName = '/fav';
  @override
  _FavScreenviewState createState() => _FavScreenviewState();
}

class _FavScreenviewState extends State<FavScreenview> {
  FavoritesController _favoritesController = FavoritesController();
  FavModel _favoritesModel = FavModel();
  bool _loading = true;
  String _token;

  @override
  void initState() {
    _getFav();
    _getToken();
    super.initState();
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  _getFav() async {
    _favoritesModel = await _favoritesController.getFavorites();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Padding(
          padding: const EdgeInsets.all(70.0),child:Text(
            getTranslated(context, 'titlefav'),
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
              onRefresh: () => _getFav(),
              child: _token == null
                  ? Center(child: Text(getTranslated(context, 'errormassage2')))
                  : _favoritesModel.stores[0].data.isEmpty
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
                                    _favoritesModel.stores[0].data.length,
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    SizedBox(
                                      height: getProportionateScreenHeight(50),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, MeettybeScreen.routeName,
                                          arguments: {
                                            'id': _favoritesModel
                                                .stores[0].data[index].id,
                                            'name': _favoritesModel
                                                .stores[0].data[index].name,
                                            'address': _favoritesModel
                                                .stores[0].data[index].address,
                                            'views': _favoritesModel
                                                .stores[0].data[index].views,
                                            'image': _favoritesModel
                                                .stores[0].data[index].image,
                                            'Fav': _favoritesModel
                                                .stores[0].data[index].favorite
                                          }),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                      _favoritesModel.stores[0]
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
                                                    _favoritesModel.stores[0]
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
                                                        Icon(Icons.favorite,
                                                            size: 30,
                                                            color: _favoritesModel
                                                                        .stores[
                                                                            0]
                                                                        .data[
                                                                            index]
                                                                        .favorite ==
                                                                    true
                                                                ? Colors.red
                                                                : Colors.grey),
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
                                                _favoritesModel
                                                    .stores[0].data[index].name,
                                                style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            16),
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
                                                          5),
                                                ),
                                                Icon(
                                                  Icons.place,
                                                ),
                                                Text(
                                                  _favoritesModel.stores[0]
                                                      .data[index].address,
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              15),
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height:
                                            //       getProportionateScreenHeight(
                                            //           5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]);
                                },
                              ),

                              //    loadMore ? Center(
                              //   //   child: CircularProgressIndicator(),
                            ) //   // ):Container()
                          ],
                        ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
