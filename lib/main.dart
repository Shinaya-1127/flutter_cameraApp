import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cameraアプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckAuth(),
    );
  }

  Widget CheckAuth() {
    if (FirebaseAuth.instance.currentUser != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}