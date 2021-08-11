import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/Transaction_model/transaction.dart';

import '../added_sales_page.dart';

class DeliveryOrderBody extends StatefulWidget {
  @override
  _DeliveryOrderBodyState createState() => _DeliveryOrderBodyState();
}

class _DeliveryOrderBodyState extends State<DeliveryOrderBody> {
  getData()async{
        await Transaction.connectToApi().then((value) => listData = value);
  }
  Widget deliveryCard({Transaction transaction, int id}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5,
            color: Color(0xffEFEFEF),
          ),
        ),
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              print("produk");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddedSalesPage(id: id)),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction.code,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xffE8B730),
                        ),
                      ),
                      Text(
                        transaction.date,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xff696969),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xffEFEFEF)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pesanan",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 50,
                        child: ListView.builder(
                          itemCount: transaction.order.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    transaction.order[i].name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                  Text(
                                    "x${(transaction.order[i].total)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration: BoxDecoration(color: Color(0xffEFEFEF)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    print("proses");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          // perbaikan
                          color: (true) ? Color(0xFF3d821e) : Color(0xffFA9217),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            // perbaikan
                            color:
                                (true) ? Color(0xffD1e6d1) : Color(0xffFEF4D1),
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      Text(
                        // perbaikan
                        (true) ? "Proses Pengiriman" : "Belum dikirim",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          // perbaikan
                          color: (true) ? Color(0xFF3d821e) : Color(0xffFA9217),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 50,
                  decoration: BoxDecoration(color: Color(0xffEFEFEF)),
                ),
                GestureDetector(
                  // onTap: () {
                  // var s = (order.isPrinted)
                  // ? "Cetak Shipping Label"
                  // : "Tambahkan Resi";
                  // print(s);
                  // },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          // perbaikan
                          (true) ? Momentumicon.bookmark : Momentumicon.deliver,
                          size: 16,
                          color: Color(0xffE8B730),
                        ),
                      ),
                      Text(
                        (true) ? "Cetak Shipping Label" : "Tambahkan Resi",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: cBlack,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Momentumicon.arrow_left),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Delivery Order",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
              Icon(
                Momentumicon.filter,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
            if (listData == null || listData.isEmpty) {
              return Container(
                child: Center(
                  child: Text("Loading"),
                ),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: listData.length,
                itemBuilder: (BuildContext context, int index) {
                  return deliveryCard(transaction: listData[index], id: index);
                },
              );
            }
          }),
          // child: ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: model.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return deliveryCard(order: model[index]);
          //   },
          // ),
        ),
      ],
    ));
  }
}
