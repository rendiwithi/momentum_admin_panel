import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';
import 'model/Api_model/login_model.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  bool iscConnected;
  void check() async {
    print('Connected');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userName = pref.getString("userName");
    var userPassword = pref.getString("userPassword");

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await LoginResult.connectToApi(
          username: (userName == null || userName.isEmpty) ? " " : userName,
          password: (userPassword == null || userPassword.isEmpty)
              ? " "
              : userPassword,
        ).then((value) => userLogin = value);

        if (userLogin.code == 200 || userLogin.code == null) {
          if (userLogin.role == "admin") {
            Navigator.pushReplacementNamed(context, '/admin/home');
          } else if (userLogin.role == "sysadmin") {
            Navigator.pushReplacementNamed(context, '/sysadmin/home');
          }
        } else {
          if (pref.getBool('isLogin') != null || pref.getBool('isLogin')) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        }
      }
    } on SocketException catch (_) {
      Navigator.pushReplacementNamed(context, '/connectionproblem');
    }
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
