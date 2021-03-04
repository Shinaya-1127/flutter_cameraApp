import 'package:flutter/material.dart';
import 'package:flutter_cameraapp/model/login_model.dart';
import '../model/login_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME'),
            // ignore: deprecated_member_use
            RaisedButton(onPressed: () => context.read<LoginModel>().signOut()),
          ],
        ),
      ),
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
