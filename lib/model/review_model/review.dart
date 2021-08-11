import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/review_model/user_review.dart';

class Review {
  int response;
  int totalRating;
  int totalComments;
  List<UserReview> userReview;

  Review({
    this.response,
    this.totalRating,
    this.totalComments,
    this.userReview,
  });

  factory Review.fromJson(
      {Map<String, dynamic> object, List<UserReview> reviewUser}) {
    return Review(
      response: object["code"],
      totalComments: object["summary"]["total_reviewers"],
      totalRating: object["summary"]["avg_product_rating"],
      userReview: reviewUser,
    );
  }

  static Future<Review> connectToApi() async {
    String key = "2f7fe98eaf8f800c267582fd53b6584f";
    String productUrl =
        "http://www.momentumlifestyle.me:3015/product/review/list";
    var apiResult = await http.post(Uri.parse(productUrl), body: {
      "key": key,
      "token": tokenUser,
      "product_id": "1",
    });

    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listReview = (jsonObject as Map<String, dynamic>)['data'];

    List<UserReview> reviews = [];

    for (var i = 0; i < listReview.length; i++) {
      reviews.add(
        UserReview.fromJson(listReview[i]),
      );
    }
    return Review.fromJson(object: jsonObject, reviewUser: reviews);
  }
}
