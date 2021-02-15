import 'package:flutter/material.dart';
import 'package:mlahem/Screens/SettingScreenForMan.dart';
import 'package:mlahem/StoreScreen/view.dart';
import 'package:mlahem/addScreen/View.dart';

class MainTapbarr2 extends StatefulWidget {
  static String routeName = '/mainTapbarr2';
  @override
  _MainTapbarr2State createState() => _MainTapbarr2State();
}

class _MainTapbarr2State extends State<MainTapbarr2>
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
          AddStoreView(),
          SettingsFormanScreen(),
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
              Icons.add,
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
