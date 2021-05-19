import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/screen/admin/HomePage/home_page.dart';
import 'package:momentum_admin_panel/screen/global/WareHousePage/history_page.dart';
import 'package:momentum_admin_panel/screen/global/WareHousePage/warehouse_page.dart';
import 'package:momentum_admin_panel/screen/global/WarehouseOnlinePage/history_online_page.dart';
import 'package:momentum_admin_panel/screen/global/WarehouseOnlinePage/warehouse_online_page.dart';
import 'package:momentum_admin_panel/screen/global/banner/manage_banner.dart';
import 'package:momentum_admin_panel/screen/global/deliveryOrder/delivery_order_page.dart';
import 'package:momentum_admin_panel/screen/global/myProduct/addProduct/add_product_screen.dart';
import 'package:momentum_admin_panel/screen/global/myProduct/my_product_admin.dart';
import 'package:momentum_admin_panel/screen/global/myProduct/my_product_screen.dart';
import 'package:momentum_admin_panel/screen/global/productReview/product_review_screen.dart';
import 'package:momentum_admin_panel/screen/global/resellerData/reseller_data.dart';
import 'package:momentum_admin_panel/screen/global/status/status_product.dart';
import 'package:momentum_admin_panel/screen/global/voucher/voucher_diskon.dart';
import 'package:momentum_admin_panel/screen/login_page.dart';
import 'package:momentum_admin_panel/screen/sysAdmin/HomePage/home_page.dart';
import 'package:momentum_admin_panel/underConst.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => LoginPage(),
  '/admin/home': (ctx) => HomePage(),
  '/sysadmin/home': (ctx) => HomePageSysAdmin(),
  '/admin/onlinewarehouse': (ctx) => WareHouseOnlinePage(),
  '/admin/onlinewarehouse/history': (ctx) => HistoryOnlinePage(),
  '/admin/warehouse': (ctx) => WareHousePage(),
  '/admin/warehouse/history': (ctx) => HistoryPage(),
  '/admin/order': (ctx) => DeliveryOrderPage(),
  '/global/addProduct': (ctx) => AddProductScreen(),
  '/global/productReview': (ctx) => ProductReviews(),
  '/global/ResellerData': (ctx) => ResselerDataScreen(),
  '/global/addVoucher': (ctx) => VoucherDiscountScreen(),
  '/global/statusProduct': (ctx) => StatusProduct(),
  '/admin/manageBanner': (ctx) => ManageBanner(),
  '/admin/myProduct': (ctx) => MyProductAdmin(),
  '/sysadmin/myProduct': (ctx) => MyProductScreen(),
  '/trial': (ctx) => UnderConstruction(),
};
