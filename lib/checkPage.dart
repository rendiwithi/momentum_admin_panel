import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckPage extends StatefulWidget {
  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  void check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('isLogin') == true) {
        Navigator.pushReplacementNamed(context, '/sysadmin/home');
        tokenUser = pref.getString('token');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
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
