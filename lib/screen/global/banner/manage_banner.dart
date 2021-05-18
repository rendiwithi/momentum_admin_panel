import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';

import 'addBanner.dart';

class ManageBanner extends StatefulWidget {
  @override
  _ManageBannerState createState() => _ManageBannerState();
}

class _ManageBannerState extends State<ManageBanner> {
  void actionPopUpItemSelected(String value) {
    String message;
    if (value == 'change') {
      message = 'You change';
    } else if (value == 'delete') {
      message = 'You delete';
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

  Widget _createBanner() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
            bottom: 15,
          ),
          margin: EdgeInsets.only(top: 5),
          color: Colors.white,
          child: Row(
            children: [
              Container(
                height: 80,
                width: 75,
                color: Color(0xffE7E7E7),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Banner Promo 12:12"),
                              Container(
                                child: PopupMenuButton(
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: Color(0xffAFAFAF),
                                  ),
                                  onSelected: (value) {
                                    print("value:$value");
                                    actionPopUpItemSelected(value);
                                  },
                                  itemBuilder: (context) {
                                    return <PopupMenuEntry>[
                                      PopupMenuItem(
                                        height: 35,
                                        value: 'change',
                                        child: Text('Ubah'),
                                      ),
                                      PopupMenuDivider(),
                                      PopupMenuItem(
                                        height: 35,
                                        value: 'delete',
                                        child: Text('Hapus'),
                                      )
                                    ];
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Momentumicon.link,
                                      size: 12,
                                      color: Color(0xff228DF0),
                                    ),
                                  ),
                                  Text(
                                    "www.link-promo.com",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff228DF0)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Momentumicon.banner,
                                      size: 12,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                  Text(
                                    "Home Banner",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 45,
                margin: EdgeInsets.only(top: 2, right: 2),
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Dilihat sebanyak : 6.512x",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff696969),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 45,
                margin: EdgeInsets.only(top: 2),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified_user,
                      color: Color(0xff228DF0),
                      size: 14,
                      // color: (data.isValidate)
                      // ? Color(0xff228DF0)
                      // : Color(0xff7D8487),
                    ),
                    Text(
                      "Diterbitkan",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff228DF0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Kelola Banner",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: cBlack,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBanner(),
              ),
            );
          },
          elevation: 0,
          backgroundColor: Color(0xffE8B730),
          child: Icon(
            Icons.add,
            color: Color(0xff715815),
          ),
        ),
        backgroundColor: cGrey,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _createBanner();
          },
        ),
      ),
    );
  }
}
