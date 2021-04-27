import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/history_page.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/warehouse_page.dart';
import 'package:momentum_admin_panel/screen/admin/WarehouseOnlinePage/warehouse_online_page.dart';
import 'package:momentum_admin_panel/screen/login_page.dart';
import 'package:momentum_admin_panel/underConst.dart';

import 'screen/admin/HomePage/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx)  => LoginPage(),
  '/admin/home': (ctx)  => HomePage(),
  '/admin/onlinewarehouse': (ctx)  => WareHouseOnlinePage(),
  '/admin/warehouse': (ctx)  => WareHousePage(),
  '/admin/warehouse/history': (ctx)  => HistoryPage(),
  '/trial': (ctx)  => UnderConstruction(),
};