import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class AddProduct {
  String id;
  int code;
  AddProduct({
    this.id,
    this.code,
  });

  factory AddProduct.fromJson(Map<String, dynamic> object) {
    return AddProduct(
      code: object["code"],
      id: (object["code"] == 200) ? (object["data"])["id"].toString() : "",
    );
  }
  static Future<AddProduct> connectToApi({
    String name,
    String desc,
    String idBrand,
    String idCategory,
    String price,
    String weight,
  }) async {
    String apiUrl = "http://www.momentumlifestyle.me:3015/product/update";
    var apiresult = await http.post(Uri.parse(apiUrl), body: {
      "key": "2f7fe98eaf8f800c267582fd53b6584f",
      "token": tokenUser,
      "name": name,
      "description": desc,
      "category_id": idCategory,
      "brand_id": idBrand,
      "default_price_sell": price,
      "status": "pending",
      "weight": weight
    });

    var jsonObj = json.decode(apiresult.body);
    return AddProduct.fromJson(jsonObj);
  }

  static Future<AddProduct> changeStatus({
    String name,
    String id,
    String idBrand,
    String idCategory,
    String price,
    String status,
  }) async {
    String apiUrl = "http://www.momentumlifestyle.me:3015/product/update";
    var apiresult = await http.post(Uri.parse(apiUrl), body: {
      "key": "2f7fe98eaf8f800c267582fd53b6584f",
      "token": tokenUser,
      "name": name,
      "id": id,
      "category_id": idCategory,
      "brand_id": idBrand,
      "default_price_sell": price,
      "status": status,
    });

    var jsonObj = json.decode(apiresult.body);
    return AddProduct.fromJson(jsonObj);
  }
}
