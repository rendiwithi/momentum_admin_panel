import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';

class BannerModel {
  int id;
  String imgUrl;
  String name;
  String status;
  String link;
  String views;
  String description;
  String type;
  BannerModel({
    this.id,
    this.name,
    this.imgUrl,
    this.status,
    this.description,
    this.views,
    this.type,
    this.link,
  });

  factory BannerModel.fromJson(Map<String, dynamic> object) {
    return BannerModel(
      id: object["id"],
      description: object["description"],
      imgUrl: object["picture"]['link'],
      link: object["link"],
      name: object["title"],
      status: "Active",
      type: "Home Banner",
      views: "10",
    );
  }

  static Future<List<BannerModel>> connectToApi() async {
    String productUrl = "http://www.momentumlifestyle.me:3015/slide/list";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
    });
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listBannerModel = (jsonObject as Map<String, dynamic>)['data'];

    List<BannerModel> bannerModel = [];
    for (var i = 0; i < listBannerModel.length; i++)
      bannerModel.add(BannerModel.fromJson(listBannerModel[i]));
    return bannerModel;
  }
}
