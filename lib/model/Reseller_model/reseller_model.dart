import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class Seller {
  int id;
  String imgUrl;
  String name;
  String email;
  String income;
  String sale;
  String created;
  String gender;
  String phone;
  String identitiyNumber;
  String bank;
  String bankNo;
  String bankUser;
  String instagram;
  String youtube;
  String tiktok;
  String code;
  String status;

  Seller({
    this.id,
    this.created,
    this.code,
    this.name,
    this.phone,
    this.bank,
    this.bankNo,
    this.bankUser,
    this.email,
    this.gender,
    this.identitiyNumber,
    this.imgUrl,
    this.income,
    this.instagram,
    this.sale,
    this.tiktok,
    this.youtube,
    this.status,
  });

  factory Seller.fromJson(Map<String, dynamic> object) {
    return Seller(
        id: object["id"],
        bank: "-",
        bankNo: "-",
        bankUser: "-",
        code: "-",
        created: "-",
        gender: "-",
        email: (object["email"] == null) ? "-" : object["email"],
        identitiyNumber: object["id_card_no"],
        imgUrl: (object["prof_pict"] == null) ? "-" : object["prof_pict"],
        income: object["shop"]["total_income"].toString(),
        instagram: (object["shop"]["instagram"] == null)
            ? "-"
            : object["shop"]["instagram"],
        tiktok:
            (object["shop"]["tiktok"] == null) ? "-" : object["shop"]["tiktok"],
        youtube: (object["shop"]["youtube"] == null)
            ? "-"
            : object["shop"]["youtube"],
        name: object["shop"]["name"],
        phone: object["phone_number"],
        sale: object["shop"]["total_sales"].toString(),
        status: object["shop"]["status"]);
  }

  static Future<List<Seller>> connectToApi({String membership}) async {
    String productUrl = "http://www.momentumlifestyle.me:3015/user/list";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
      "token": tokenUser,
      "membership": membership,
    });
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listReseller = (jsonObject as Map<String, dynamic>)['data'];

    List<Seller> products = [];
    for (var i = 0; i < listReseller.length; i++)
      products.add(Seller.fromJson(listReseller[i]));
    return products;
  }
}
