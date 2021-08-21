import 'package:momentum_admin_panel/model/Product_model/product.dart';
import 'package:momentum_admin_panel/model/Reseller_model/reseller_model.dart';
import 'package:momentum_admin_panel/model/Transaction_model/transaction.dart';
import 'package:momentum_admin_panel/model/review_model/review.dart';
import 'package:momentum_admin_panel/model/voucher_model/voucher.dart';

// Penting
String key = "2f7fe98eaf8f800c267582fd53b6584f";

List<Product> productModelOffline;
List<Product> productModelOnline;
List<Product> productModelPending;
List<Product> productModelActive;
List<Seller> sellerActive;
List<Transaction> listData = [];
Review reviewProduct;
String tokenUser;
List<Voucher> voucherDataPending;
List<Voucher> voucherDataActive;
