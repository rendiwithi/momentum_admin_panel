import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyProductBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1, bottom: 5),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg",
                            height: 55,
                            width: 55,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 5, left: 15),
                            height: 55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Scarlett Whitening Body Scrub Romansa",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Stok Barang : 5",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff696969),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuButton(
                          child: Icon(Icons.more_horiz),
                          onSelected: (value) {
                            print("value:$value");
                            actionPopUpItemSelected(value);
                          },
                          itemBuilder: (context) {
                            return <PopupMenuEntry>[
                              PopupMenuItem(
                                height: 35,
                                value: 'Agree',
                                child: Text('Setuju & Terbitkan'),
                              ),
                              PopupMenuDivider(),
                              PopupMenuItem(
                                height: 35,
                                value: 'Disagree',
                                child: Text('Belum Disetujui'),
                              )
                            ];
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 55,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 30, right: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 76.500",
                                style: TextStyle(
                                  color: Color(0xffE8B730),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color: Color(0xff228DF0),
                                    size: 18,
                                  ),
                                  Text(
                                    "Diterbitkan",
                                    style: TextStyle(
                                      color: Color(0xff228DF0),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffEFEFEF),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void actionPopUpItemSelected(String value) {
    String message;
    if (value == 'Agree') {
      message = 'You Agree';
    } else if (value == 'Disagree') {
      message = 'You Disagree';
    } else {
      message = 'Not implemented';
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // timeInSecForIos: 1,
    );
  }
}
