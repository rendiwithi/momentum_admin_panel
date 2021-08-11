import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/Transaction_model/transaction.dart';

class AddedSalesPage extends StatefulWidget {
  final int id;
  AddedSalesPage({Key key, @required this.id}) : super(key: key);
  @override
  _AddedSalesPageState createState() => _AddedSalesPageState();
}

class _AddedSalesPageState extends State<AddedSalesPage> {
  @override
  Widget build(BuildContext context) {
  Transaction modelsales = listData[widget.id];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: cBlack,
              child: Stack(
                textDirection: TextDirection.ltr,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: IconButton(
                      icon: Icon(Momentumicon.arrow_left),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      modelsales.code,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 4, bottom: 4),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Pesanan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF5F5F5),
                    ),
                    Container(
                      // color: Colors.red,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: modelsales.order.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          modelsales.order[index].imgUrl,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                modelsales.order[index].name,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "Jumlah : ${modelsales.order[index].total} pcs",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff696969),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          // child: (model.order[index].isSold)
                                          child: (false)
                                              ? Icon(
                                                  Momentumicon.qr_check,
                                                )
                                              : Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Center(
                                                      child: Icon(
                                                        Momentumicon.qr_check,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: -10,
                                                      right: -10,
                                                      child: Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            Color(0xff2FA048),
                                                        size: 20,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // (model.order[index].notes.length != 0)
                                (false)
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Catatan",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              // model.order[index].notes,
                                              "HEHE",
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                color: Color(0xff696969),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xffF5F5F5),
                                ),
                              ],
                            );
                          }),
                    ),
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF5F5F5),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              "Informasi Pembeli",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffF5F5F5),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              modelsales.nameCustomer,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(modelsales.addressCustomer),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(modelsales.phoneCustomer),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF5F5F5),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                            ),
                            child: Text(
                              "Metode Pengiriman",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffF5F5F5),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              modelsales.shipment,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // (model.isDelivered)
                          (false)
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              "Nomor Resi",
                                              style: TextStyle(
                                                color: Color(0xff696969),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "JNE0985123511",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 60,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: cBlack,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Lacak",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffF5F5F5),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                            color: cBlack,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: (model.isDelivered)?Icon(
                                child: (true)?Icon(
                                  Momentumicon.bookmark,
                                  color: Color(0xffE8B730),
                                ):Icon(
                                  Momentumicon.deliver,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                // (model.isDelivered)?"Cetak Shipping Label":"Tambahkan Resi",
                                (true)?"Cetak Shipping Label":"Tambahkan Resi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
