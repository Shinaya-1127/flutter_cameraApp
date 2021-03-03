import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.album),
                title: new Text("アルバム"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.timer),
                title: new Text("タイマー"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.account_circle),
                title: new Text("アカウント"),
              ),
            ],
          ),
    );
  }
}