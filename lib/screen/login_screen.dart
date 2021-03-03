import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

import '../model/login_model.dart';

class LoginScreen extends StatelessWidget {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ログイン"),
        ),
        body: Consumer<LoginModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 13,
                right: 13,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: mailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        hintText: 'example@dmain.com',
                        labelText: 'メールアドレス',
                      ),
                      onChanged: (text) {
                        model.email = text;
                      },
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'password',
                        labelText: 'パスワード',
                      ),
                      onChanged: (text) {
                        model.password = text;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await model.login();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } catch (e) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return WillPopScope(
                                  onWillPop: () async => false,
                                  child: AlertDialog(
                                    title: Text(e.toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("閉じる"),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      },
                      child: Text("ログイン"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: Icon(Icons.account_circle),
                                onPressed: () {},
                                label: Text("Googleでログイン"),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: Icon(Icons.account_circle),
                                onPressed: () {},
                                label: Text("Instagramでログイン"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}