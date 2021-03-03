import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String email = "";
  String password = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    if (email.isEmpty) {
      throw ("メールアドレスを入力してください");
    }
    if (password.isEmpty) {
      throw ("パスワードを入力してください");
    }
    final result = await _auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .catchError((e) => 
              throw (e.toString()),
            );
  }
}