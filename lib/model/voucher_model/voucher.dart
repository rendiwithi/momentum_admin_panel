import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class Voucher {
  int id;
  String code;
  String description;
  String title;
  String percentage;
  String status;
  String expired;
  String views;
  Voucher({
    this.id,
    this.code,
    this.title,
    this.views,
    this.status,
    this.expired,
    this.percentage,
    this.description,
  });

  factory Voucher.fromJson(Map<String, dynamic> object) {
    return Voucher(
      id: object["id"],
      code: object["code"],
      title: object["title"],
      views: object["views"].toString(),
      status: object["status"],
      expired: object["expired"],
      percentage: object["percentage"].toString(),
      description: object["description"],
    );
  }
  static Future<List<Voucher>> connectToApi({String status}) async {
    String key = "2f7fe98eaf8f800c267582fd53b6584f";
    String transactionUrl = "http://www.momentumlifestyle.me:3015/voucher/list";
    
    var apiVoucher = await http.post(Uri.parse(transactionUrl), body: {
      "key": key,
      "token": tokenUser,
    });
    var jsonObject = json.decode(apiVoucher.body);

    List<dynamic> listJsonVoucher =
        (jsonObject as Map<String, dynamic>)['data'];

    List<Voucher> listVoucher = [];

    for (var i = 0; i < listJsonVoucher.length; i++) {
      if (listJsonVoucher[i]["status"] == status) {
        listVoucher.add(Voucher.fromJson(listJsonVoucher[i]));
      }
    }
    return listVoucher;
  }
}
