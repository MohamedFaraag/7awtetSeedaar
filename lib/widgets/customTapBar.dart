import 'package:flutter/material.dart';
import 'package:mlahem/FavScreen/view.dart';
import 'package:mlahem/Screens/SettingScreen.dart';
import 'package:mlahem/StoreScreen/view.dart';

class MainTapbarr extends StatefulWidget {
  static String routeName = '/mainTapbarr';
  @override
  _MainTapbarrState createState() => _MainTapbarrState();
}

class _MainTapbarrState extends State<MainTapbarr>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      body: TabBarView(
        children: <Widget>[
          StoreScreen(),
          FavScreenview(),
          SettingsScreen(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar:
          //Container(
          //  padding: EdgeInsets.all(30.0),
          // child: ClipRRect(
          // borderRadius: BorderRadius.all(
          // Radius.circular(50.0),
          // ),
          Container(
        height: 60,
        width: 80,
        color: Colors.blueGrey[50],
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.green,
          indicator: UnderlineTabIndicator(
              // borderSide: BorderSide(color: Colors.black, width: 0.0),
              //insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
          indicatorColor: Colors.green,
          labelStyle: TextStyle(fontSize: 10),
          tabs: <Widget>[
            Icon(
              Icons.home,
              size: 23,
            ),
            Icon(
              Icons.favorite,
              size: 23,
            ),
            Icon(
              Icons.settings,
              size: 23,
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
