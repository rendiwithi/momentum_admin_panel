import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class ProductUpdate {
  String status;

  ProductUpdate({this.status});

  factory ProductUpdate.fromJson(Map<String, dynamic> object) {
    return ProductUpdate(status: object["code"].toString());
  }

  static Future<ProductUpdate> connectToApi({String id, String quantity}) async {
    String key = "2f7fe98eaf8f800c267582fd53b6584f";
    String productUrl =
        "http://www.momentumlifestyle.me:3015/product/stock/update";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
      "token": tokenUser,
      "product_id": id,
      "quantity": quantity,
    });
    var jsonObject = json.decode(apiResult.body);
    return ProductUpdate.fromJson(jsonObject);
  }
}
