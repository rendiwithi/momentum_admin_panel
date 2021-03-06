import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/model/voucher_model.dart';

import 'add_voucher.dart';

class VoucherDiscountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Voucher Kupon",
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
          elevation: 0,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddVoucher(),
                ));
          },
          backgroundColor: Color(0xffE8B730),
          child: Icon(
            Icons.add,
            color: Color(0xff715815),
          ),
        ),
        backgroundColor: cGrey,
        body: ListView.builder(
          itemCount: voucher.length,
          itemBuilder: (BuildContext context, int index) {
            VoucherModel model = voucher[index];
            return Container(
              margin: EdgeInsets.only(top: 5),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 10,
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
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
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      model.desc,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff696969),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 10,
                    ),
                    child: Text(
                      "${(model.start)} - ${(model.end)}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffE8B730),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: cGrey,
                  ),
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              model.claim,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff696969),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 1,
                          color: cGrey,
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: (model.isValidation)
                                    ? Color(0xff228DF0)
                                    : Color(0xff7D8487),
                                size: 18,
                              ),
                              Text(
                                (model.isValidation)
                                    ? "Diterbitkan"
                                    : "Menunggu Divalidasi",
                                style: TextStyle(
                                  color: (model.isValidation)
                                      ? Color(0xff228DF0)
                                      : Color(0xff7D8487),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
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
