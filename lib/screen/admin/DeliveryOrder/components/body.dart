import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';

class DeliveryOrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
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
                      "AC9885120098",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xffE8B730),
                      ),
                    ),
                    Text(
                      "24 Mar 2020 , 1${(index)}:00",
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Belia Maybelline Hypercurl Volum Express",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff696969),
                            ),
                          ),
                          Text(
                            "x1",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff696969),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Belia Maybelline Hypercurl Volum Express",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff696969),
                            ),
                          ),
                          Text(
                            "x1",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFF3d821e),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3,
                              color: Color(0xffD1e6d1),
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        Text(
                          "Proses Pengiriman",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff1B8219),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      decoration: BoxDecoration(color: Color(0xffEFEFEF)),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Momentumicon.bookmark,
                            size: 16,
                            color: Color(0xffE8B730),
                          ),
                        ),
                        Text(
                          "Cetak Shipping Label",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
