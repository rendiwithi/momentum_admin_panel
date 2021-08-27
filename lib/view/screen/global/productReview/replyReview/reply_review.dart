import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/TextStyleCustom.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:momentum_admin_panel/model/review_model/user_review.dart';

class ReplyReviewScreen extends StatefulWidget {
  final UserReview model;
  ReplyReviewScreen({Key key, @required this.model}) : super(key: key);

  @override
  _ReplyReviewScreenState createState() => _ReplyReviewScreenState();
}

class _ReplyReviewScreenState extends State<ReplyReviewScreen> {
  TextEditingController replyController = new TextEditingController();
  // FilePickerResult result;
  String name;
  var review;
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

  // void chooseImage() async {
  //   result = await FilePicker.platform.pickFiles(
  //     type: FileType.media,
  //   );
  //   if (result != null) {
  //     PlatformFile file = result.files.first;

  //     print(file.name);
  //     name = file.name;
  //     print(file.bytes);
  //     print(file.size);
  //     print(file.extension);
  //     print(file.path);
  //   } else {
  //     print("Ga ada pilihan");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Balas Produk"),
          backgroundColor: cBlack,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF5F5F5),
            ),
            ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.username ,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6000000),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              widget.model.time,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff666666),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _createStar(widget.model.rate),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15,right: 15, top: 10,bottom: 10),
                  child: Text(
                    widget.model.comment ,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff666666),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Beri Balasan",
                        style: titleBold,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffE5E5E5),
                          ),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          maxLines: 10,
                          controller: replyController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Berikan balasan untuk ulasan ini",
                            hintStyle: TextStyle(
                              color: Color(0xff696969),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Lampiran",
                        style: titleBold,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // result = await FilePicker.platform.pickFiles(
                          //   type: FileType.media,
                          // );
                          // setState(() {
                          //   if (result != null) {
                          //     PlatformFile file = result.files.first;
                          //     print(file.name);
                          //     name = file.name;
                          //     print(file.bytes);
                          //     print(file.size);
                          //     print(file.extension);
                          //     print(file.path);
                          //   } else {
                          //     print("Ga ada pilihan");
                          //   }
                          // });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              Icon(Icons.attach_file),
                              Text(
                                "asd",
                                // (result != null)
                                //     ? name
                                //     : "Tambahkan File / Foto",
                                style: titleBold,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding:
                    EdgeInsets.only(bottom: 12, top: 12, left: 15, right: 15),
                child: GestureDetector(
                  onTap: () {
                    // review = replyController.text;
                    // print(review);
                    // // widget.model.reviewReply = replyController.text;
                    // // widget.model.timeReply = "15 Juni 2021";
                    // // widget.model.userReply = "Momentum Admin";
                    // (review == "" || review == " " || review == "  ")
                    //     ? Fluttertoast.showToast(
                    //         msg: "Masukkan Review Anda",
                    //         toastLength: Toast.LENGTH_SHORT,
                    //         gravity: ToastGravity.BOTTOM,
                    //         // timeInSecForIos: 1,
                    //       )
                    //     : Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => ProductReviews(),
                    //         ),
                    //       );
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: cBlack, borderRadius: BorderRadius.circular(10)),
                    // onPressed: () {
                    // review=replyController.text;
                    // print(review);
                    // widget.model.reviewReply = replyController.text;
                    // widget.model.timeReply = "15 Juni 2021";
                    // widget.model.userReply = "Momentum Admin";
                    // },

                    child: Center(
                      child: Text(
                        "Tambahkan Balasan",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
