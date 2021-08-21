class UserReview {
  int id;
  int productId;
  int rate;
  String username;
  String comment;
  String time;
  UserReview({
    this.id,
    this.rate,
    this.time,
    this.productId,
    this.username,
    this.comment,
  });

  factory UserReview.fromJson(Map<String, dynamic> object) {
    return UserReview(
      id: object["id"],
      productId: object["id"],
      rate: object["product_rating"],
      comment: object["comment"],
      username: object["user"]["username"],
      time: object["created_at"],
    );
  }
}
