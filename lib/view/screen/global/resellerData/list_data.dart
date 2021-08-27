import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/Reseller_model/reseller_model.dart';

import 'resellerDetail/reseller_detail_page.dart';

class ListData extends StatefulWidget {
  const ListData({key}) : super(key: key);

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {

  getSeller() async {
    await Seller.connectToApi(membership: "seller")
        .then((value) => sellerActive = value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSeller(),
      builder: (context, snapshot) {
        if (sellerActive != null) {
          return ListView.builder(
            itemCount: sellerActive.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // print(sellerActive[index].bank);
                  // print(sellerActive[index].bankNo);
                  // print(sellerActive[index].bankUser);
                  // print(sellerActive[index].code);
                  // print(sellerActive[index].created);
                  // print(sellerActive[index].email);
                  // print(sellerActive[index].gender);
                  // print(sellerActive[index].id);
                  // print(sellerActive[index].identitiyNumber);
                  // print(sellerActive[index].imgUrl);
                  // print(sellerActive[index].income);
                  // print(sellerActive[index].instagram);
                  // print(sellerActive[index].name);
                  // print(sellerActive[index].phone);
                  // print(sellerActive[index].sale);
                  // print(sellerActive[index].status);
                  // print(sellerActive[index].tiktok);
                  // print(sellerActive[index].youtube);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResellerDetailPage(
                        data: sellerActive[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        sellerActive[index].imgUrl,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sellerActive[index].name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      Text(
                                        sellerActive[index].email,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: PopupMenuButton(
                                child: Icon(Icons.more_horiz),
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
                      Container(
                        padding: EdgeInsets.all(15),
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Penjualan",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Rp. ${(sellerActive[index].income)},-",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE8B730),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color:
                                        (sellerActive[index].status != "seller")
                                            ? Color(0xff228DF0)
                                            : Color(0xff7D8487),
                                    size: 16,
                                  ),
                                  Text(
                                    (sellerActive[index].status != "seller")
                                        ? "Diterbitkan"
                                        : "Menunggu Divalidasi",
                                    style: TextStyle(
                                      color: (sellerActive[index].status !=
                                              "seller")
                                          ? Color(0xff228DF0)
                                          : Color(0xff7D8487),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Container(
            child: Center(
              child: Text("Loading"),
            ),
          );
        }
      },
    );
  }
}

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
