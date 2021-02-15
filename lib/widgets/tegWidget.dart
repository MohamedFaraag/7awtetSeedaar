import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TegEidget extends StatefulWidget {
  static String routeName = '/ss';
  @override
  _TegEidgetState createState() => _TegEidgetState();
}

class _TegEidgetState extends State<TegEidget> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide Bottom Navigation Bar'),
      ),
      body: ListView(children: [Container()]),
      bottomNavigationBar: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse
                ? 0
                : 200,
            child: child,
          );
        },
        child: BottomNavigationBar(
          backgroundColor: Colors.amber[200],
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 23,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 23,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
