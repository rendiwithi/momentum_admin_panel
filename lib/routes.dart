import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/view/screen/connection_problem.dart';
import 'package:momentum_admin_panel/view/screen/global/WarehouseOnlinePage/warehouse_online_page.dart';
import 'package:momentum_admin_panel/view/screen/global/comission/commission_menu.dart';
import 'package:momentum_admin_panel/view/screen/global/manageStaff/manageStaff.dart';
import 'package:momentum_admin_panel/view/screen/global/voucher/voucher_diskon_sysadmin.dart';

import 'checkPage.dart';
import 'underConst.dart';
import 'view/screen/global/WareHousePage/history_page.dart';
import 'view/screen/global/WareHousePage/warehouse_page.dart';
import 'view/screen/global/WarehouseOnlinePage/history_online_page.dart';
import 'view/screen/global/banner/manage_banner.dart';
import 'view/screen/global/banner/manage_banner_sysadmin.dart';
import 'view/screen/global/deliveryOrder/delivery_order_page.dart';
import 'view/screen/global/incomePage/incomePage.dart';
import 'view/screen/global/myProduct/addProduct/add_product_screen.dart';
import 'view/screen/global/myProduct/my_product_admin.dart';
import 'view/screen/global/myProduct/my_product_screen.dart';
import 'view/screen/global/productReview/product_review_screen.dart';
import 'view/screen/global/resellerData/reseller_data.dart';
import 'view/screen/global/resellerData/reseller_data_sysadmin.dart';
import 'view/screen/global/status/status_product.dart';
import 'view/screen/global/voucher/voucher_diskon.dart';
import 'view/screen/login_page.dart';
import 'view/screen/sysAdmin/HomePage/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => CheckPage(),
  '/connectionproblem': (ctx) => ConnectionProblem(),
  '/login': (ctx) => LoginPage(),
  // HOME
  '/sysadmin/home': (ctx) => HomePageSysAdmin(),
  '/admin/onlinewarehouse': (ctx) => WareHouseOnlinePage(),
  '/admin/onlinewarehouse/history': (ctx) => HistoryOnlinePage(),
  '/admin/warehouse': (ctx) => WareHousePage(),
  '/admin/warehouse/history': (ctx) => HistoryPage(),
  '/sysadmin/manageStaff': (ctx) => ManageStaff(),
  '/admin/order': (ctx) => DeliveryOrderPage(),
  '/global/addProduct': (ctx) => AddProductScreen(),
  '/global/productReview': (ctx) => ProductReviews(),
  '/admin/ResellerData': (ctx) => ResselerDataScreen(),
  '/sysadmin/ResellerData': (ctx) => ResellerDataSysadmin(),
  '/global/addVoucher': (ctx) => VoucherDiscountScreen(),
  '/sysadmin/addVoucher': (ctx) => VoucherDiskonSysadmin(),
  '/global/statusProduct': (ctx) => StatusProduct(),
  '/admin/manageBanner': (ctx) => ManageBanner(),
  '/sysadmin/manageBanner': (ctx) => ManageBannerSysadmin(),
  '/admin/myProduct': (ctx) => MyProductAdmin(),
  '/sysadmin/myProduct': (ctx) => MyProductScreen(),
  '/sysadmin/income': (ctx) => IncomePage(),
  '/comissionTransfer': (ctx) => ComissionTransfer(),
  '/trial': (ctx) => UnderConstruction(),
};
