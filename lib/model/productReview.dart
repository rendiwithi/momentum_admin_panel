class ProductReviewModel {
  final String user;
  final String time;
  final String review;
  String reviewReply;
  String userReply;
  String timeReply;
  final int rating;

  ProductReviewModel({
    this.user,
    this.time,
    this.review,
    this.reviewReply,
    this.userReply,
    this.timeReply,
    this.rating,
  });
}

var productReview = [
  ProductReviewModel(
    user: "Nivada Mayang C",
    time: "9 Juni 2020",
    review:
        "Beli disini selalu untung , harga jauh lebih murah dari toko toko lain pelayanan ramah dan cepatt",
    reviewReply: "",
    rating: 5,
  ),
  ProductReviewModel(
    user: "Syahru Murtadho",
    time: "10 Juni 2020",
    review:
        "Respon penjual cukup cepat, produk sesuai dengan yang saya harapkan. Terimakasih",
    reviewReply: "",
    rating: 3,
  ),
  ProductReviewModel(
    user: "Yudha Adi P",
    time: "11 Juni 2021",
    review:
        "Beli disini selalu untung , harga jauh lebih murah dari toko toko lain pelayanan ramah dan cepatt",
    reviewReply: "Terimakasih atas reviewnya :)",
    userReply: "Admin",
    timeReply: "12 Juni 2021",
    rating: 4,
  ),
];
