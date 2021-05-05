import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/history_page.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/warehouse_page.dart';
import 'package:momentum_admin_panel/screen/admin/WarehouseOnlinePage/history_online_page.dart';
import 'package:momentum_admin_panel/screen/admin/WarehouseOnlinePage/warehouse_online_page.dart';
import 'package:momentum_admin_panel/screen/global/addProduct/add_product_screen.dart';
import 'package:momentum_admin_panel/screen/login_page.dart';
import 'package:momentum_admin_panel/screen/sysAdmin/HomePage/home_page.dart';
import 'package:momentum_admin_panel/screen/global/DeliveryOrder/delivery_order_page.dart';
import 'package:momentum_admin_panel/underConst.dart';
import 'screen/admin/HomePage/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => LoginPage(),
  '/admin/home': (ctx) => HomePage(),
  '/sysadmin/home': (ctx) => HomePageSysAdmin(),
  '/admin/onlinewarehouse': (ctx) => WareHouseOnlinePage(),
  '/admin/onlinewarehouse/history': (ctx) => HistoryOnlinePage(),
  '/admin/warehouse': (ctx) => WareHousePage(),
  '/admin/warehouse/history': (ctx) => HistoryPage(),
  '/admin/order': (ctx) => DeliveryOrderPage(),
  '/global/product': (ctx) => AddProductScreen(),
  '/trial': (ctx) => UnderConstruction(),
};
