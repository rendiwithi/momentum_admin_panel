import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class RemoveBanner {
  String msg;
  RemoveBanner({
    this.msg,
  });

  factory RemoveBanner.fromJson(Map<String, dynamic> object) {
    return RemoveBanner(
      msg: object["message"],
    );
  }

  static Future<RemoveBanner> connectToApi({String id}) async {
    String productUrl = "http://www.momentumlifestyle.me:3015/slide/remove";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
      "token": tokenUser,
      "id": id
    });
    var jsonObject = json.decode(apiResult.body);

    return RemoveBanner.fromJson(jsonObject);
  }
}
