import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/warehouse_page.dart';
import 'package:momentum_admin_panel/screen/login_page.dart';
import 'package:momentum_admin_panel/underConst.dart';

import 'screen/admin/HomePage/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx)  => LoginPage(),
  '/admin/home': (ctx)  => HomePage(),
  '/admin/warehouse': (ctx)  => WareHousePage(),
  '/trial': (ctx)  => UnderConstruction(),
};