import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class ProductDetail {
  String name;
  String id;
  String stock;
  String imgURL;
  ProductDetail({
    this.name,
    this.id,
    this.stock,
    this.imgURL,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> object) {
    return ProductDetail(
      name: object["name"],
      id: object["id"].toString(),
      stock: object["stock"].toString(),
      imgURL: object["pictures"][0]["link"],
    );
  }
  factory ProductDetail.jsonNotFound(Map<String, dynamic> object) {
    return ProductDetail(
      name: "null",
      id: "null",
      stock: "null",
      imgURL: "null",
    );
  }

  static Future<ProductDetail> connectToApi(
      {String id}) async {
    String key = "2f7fe98eaf8f800c267582fd53b6584f";
    String productUrl = "http://www.momentumlifestyle.me:3015/product/detail";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
      "token": tokenUser,
      "id": id,
    });
    var jsonObject = json.decode(apiResult.body);
    if (jsonObject["code"] == 200) {
      var data = jsonObject['data'];
      return ProductDetail.fromJson(data);
    } else {
      return ProductDetail.jsonNotFound(jsonObject);
    }
  }
}
