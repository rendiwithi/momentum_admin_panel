import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/banner/banner_model.dart';
import 'package:momentum_admin_panel/model/banner/remove_banner.dart';

class BannerList extends StatefulWidget {
  const BannerList({key}) : super(key: key);

  @override
  _BannerListState createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  RemoveBanner remove;
  actionPopUpItemSelected({String value, BannerModel model}) {
    String message;
    if (value == 'change') {
      message = 'You change';
    } else if (value == 'pending') {
      // message = 'You delete ${model.id}';
      RemoveBanner.connectToApi(id: model.id.toString());
      message = "Banner Delete";
    } else {
      message = 'Not implemented';
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  getBanner() async {
    await BannerModel.connectToApi().then((value) => listBanner = value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBanner(),
        builder: (context, snapshot) {
          if (listBanner == null || listBanner.isEmpty) {
            return Container(
              child: Center(
                child: Text("Loading"),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: listBanner.length,
              itemBuilder: (BuildContext context, int index) {
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
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffE7E7E7),
                              image: DecorationImage(
                                image: NetworkImage(listBanner[index].imgUrl),
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 80,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(listBanner[index].name),
                                          Container(
                                            child: PopupMenuButton(
                                              child: Icon(
                                                Icons.more_horiz,
                                                color: Color(0xffAFAFAF),
                                              ),
                                              onSelected: (value) async{
                                                await actionPopUpItemSelected(
                                                  value: value,
                                                  model: listBanner[index],
                                                );
                                                setState(() {});
                                              },
                                              itemBuilder: (context) {
                                                return <PopupMenuEntry>[
                                                  PopupMenuItem(
                                                    height: 35,
                                                    value: 'change',
                                                    child: Text('ubah'),
                                                  ),
                                                  PopupMenuDivider(),
                                                  PopupMenuItem(
                                                    height: 35,
                                                    value: 'pending',
                                                    child: Text('hapus'),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Icon(
                                                  Momentumicon.link,
                                                  size: 12,
                                                  color: Color(0xff228DF0),
                                                ),
                                              ),
                                              Text(
                                                listBanner[index].link,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff228DF0)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Icon(
                                                  Momentumicon.banner,
                                                  size: 12,
                                                  color: Color(0xff696969),
                                                ),
                                              ),
                                              Text(
                                                listBanner[index].type,
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
                                "Dilihat sebanyak : ${listBanner[index].views}",
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
              },
            );
          }
        });
  }
}
