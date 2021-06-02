import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  void check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('isLogin') != true) {
      pref.setString('route', '/login');
    }
    Navigator.pushReplacementNamed(context, pref.getString('route'));
    print(pref.getBool('isLogin').toString());
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
