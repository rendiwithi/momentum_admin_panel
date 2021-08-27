import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class NewBanner {
  String id;
  NewBanner({
    this.id,
  });

  factory NewBanner.fromJson(Map<String, dynamic> object) {
    return NewBanner(
      id: object["data"]["id"].toString(),
    );
  }

  static Future<NewBanner> connectToApi({
    String title,
    String desc,
    String link,
  }) async {
    String productUrl = "http://www.momentumlifestyle.me:3015/slide/update";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
      "token": tokenUser,
      "title": title,
      "description": desc,
      "link": link,
    });
    var jsonObject = json.decode(apiResult.body);

    return NewBanner.fromJson(jsonObject);
  }
}
