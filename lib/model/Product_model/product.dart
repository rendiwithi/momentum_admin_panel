import 'dart:convert';

import 'package:http/http.dart' as http;

class Product {
  String name;
  String imgUrl;
  String notes;
  bool isSold;
  int id;
  int idBrand;
  int idCategory;
  int stock;
  int code;
  int price;


  Product({
    this.id,
    this.idBrand,
    this.idCategory,
    this.stock,
    this.notes,
    this.name,
    this.isSold,
    this.imgUrl,
    this.code,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> object) {
    return Product(
      id: object["id"],
      idBrand: object["brand"]["id"],
      idCategory: object["category"]["id"],
      name: object["name"],
      stock: object["stock"],
      price: object["default_price_sell"],
      imgUrl: object["pictures"][0]["link"],
    );
  }

  static Future<List<Product>> connectToApi({String status}) async {
    String key = "2f7fe98eaf8f800c267582fd53b6584f";
    String productUrl = "http://www.momentumlifestyle.me:3015/product/list";
    var apiResult = await http
        .post(Uri.parse(productUrl), body: {"key": key, "status": status});
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listProduct = (jsonObject as Map<String, dynamic>)['data'];

    List<Product> products = [];
    for (var i = 0; i < listProduct.length; i++)
      products.add(Product.fromJson(listProduct[i]));

    return products;
  }
}
