import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/model/Product_model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/data.dart';

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
    Product.connectToApi().then((value) => productModel = value);
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
