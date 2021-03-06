import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/review_model/review.dart';
import 'package:momentum_admin_panel/model/review_model/user_review.dart';
import 'package:momentum_admin_panel/view/screen/global/productReview/replyReview/reply_review.dart';

class ProductReviews extends StatefulWidget {
  @override
  _ProductReviewsState createState() => _ProductReviewsState();
}

class _ProductReviewsState extends State<ProductReviews> {
  getData() async {
    await Review.connectToApi().then((value) => reviewProduct = value);
  }

  Widget _createStar(int rating) {
    return Row(
      children: [
        Icon(
          Momentumicon.star,
          color: (1 <= rating) ? Color(0xffFFC107) : Color(0xffD8D8D8),
          size: 18,
        ),
        Icon(
          Momentumicon.star,
          color: (2 <= rating) ? Color(0xffFFC107) : Color(0xffD8D8D8),
          size: 18,
        ),
        Icon(
          Momentumicon.star,
          color: (3 <= rating) ? Color(0xffFFC107) : Color(0xffD8D8D8),
          size: 18,
        ),
        Icon(
          Momentumicon.star,
          color: (4 <= rating) ? Color(0xffFFC107) : Color(0xffD8D8D8),
          size: 18,
        ),
        Icon(
          Momentumicon.star,
          color: (5 == rating) ? Color(0xffFFC107) : Color(0xffD8D8D8),
          size: 18,
        ),
      ],
    );
  }

  Widget _heading() {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 1, top: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ulasan Produk",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: _createStar(reviewProduct.totalRating),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Text(
                    "${reviewProduct.totalRating} dari 5",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "(${reviewProduct.totalComments} ulasan)",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xff6969696),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewChat(UserReview review) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.username ,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6000000),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      review.time,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),
                ],
              ),
              _createStar(review.rate),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              review.comment,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff666666),
              ),
            ),
          ),
          (true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReplyReviewScreen(
                              model: review,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 30,
                        width: 80,
                        color: Color(0xffDCE1E3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Momentumicon.chat,
                              size: 16,
                            ),
                            Text(
                              "Balas",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff37474F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "review.userReply",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          review.time,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "review.reviewReply",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Ulasan Produk",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: cBlack,
            elevation: 0,
          ),
          body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (reviewProduct == null ||
                  reviewProduct.userReview == null ||
                  reviewProduct.userReview.isEmpty) {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: 1 + reviewProduct.userReview.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: (index == 0)
                          ? _heading()
                          : _reviewChat(reviewProduct.userReview[index - 1]),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
