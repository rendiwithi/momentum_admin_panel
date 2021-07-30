import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/model/Api_model/login_model.dart';
import 'package:momentum_admin_panel/model/Transaction_model/order.dart';

class Transaction {
  String code;
  String date;
  String status;
  List<Order> order;
  Transaction({this.code, this.date, this.status, this.order});

  factory Transaction.fromJson({
    Map<String, dynamic> object,
    List<Order> orderUsr,
  }) {
    return Transaction(
      code: object["code"],
      date: object["date"],
      status: object["status"],
      order: orderUsr,
    );
  }
  static Future<List<Transaction>> connectToApi() async {
    String key = "2f7fe98eaf8f800c267582fd53b6584f";
    String transactionUrl =
        "http://www.momentumlifestyle.me:3015/transaction/list";
    var apiResult = await http.post(Uri.parse(transactionUrl), body: {
      "key": key,
      "token": userLogin.token,
      "status": "pending",
    });
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listTransaction =
        (jsonObject as Map<String, dynamic>)['data'];
    List<Transaction> transaction = [];
    for (var i = 0; i < listTransaction.length; i++) {
      List<Order> orderUser = [];
      List<dynamic> listDetails =
          (jsonObject as Map<String, dynamic>)['data'][i]['details'];
      for (var y = 0; y < listDetails.length; y++) {
        orderUser.add(Order.fromJson(listDetails[y]));
        
      }
      transaction.add(Transaction.fromJson(
          object: listTransaction[i], orderUsr: orderUser));
      print(orderUser.length);
    }
    return transaction;
  }
}

List<Transaction> listData = [];
