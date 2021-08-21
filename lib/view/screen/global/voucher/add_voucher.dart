import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';

class AddVoucher extends StatefulWidget {
  @override
  _AddVoucherState createState() => _AddVoucherState();
}

class _AddVoucherState extends State<AddVoucher> {
  TextEditingController codeController,
      nominalController,
      startController,
      endController,
      descController,
      titleController,
      valueLimitController;
  bool isRp = true;
  Widget _createTextField({
    String name,
    String hint,
    TextEditingController controller,
    TextInputType type,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xffE5E5E5),
              ),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Color(0xff696969),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createNominal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nominal",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            isRp = !isRp;
            setState(() {
              
            });
            print(isRp);
          },
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                        ),
                        child: Center(
                          child: Text((isRp)?"Rp":"%"),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: (isRp)?nominalController:valueLimitController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                            hintText: "",
                            hintStyle: TextStyle(
                              color: Color(0xff696969),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xffEAEAEA),
                height: 50,
                width: 90,
                margin: EdgeInsets.only(top: 10, left: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                            color: (isRp)?cBlack:Color(0xffE5E5E5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Rp",
                            style: TextStyle(color: (isRp)?Colors.white:Color(0xff696969)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: (isRp)?Color(0xffE5E5E5):cBlack,
                            borderRadius: BorderRadius.circular(5)),
                        height: 50,
                        child: Center(
                          child: Text(
                            "%",
                            style: TextStyle(
                              color: (isRp)?Color(0xff696969):Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

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
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: ListView(
                children: [
                  _createTextField(
                    controller: titleController,
                    name: "Title Voucher",
                    type: TextInputType.name,
                    hint: "Title Voucher",
                  ),
                  _createTextField(
                    controller: codeController,
                    name: "Nama / Kode Voucher",
                    type: TextInputType.name,
                    hint: "Nama / Kode Voucher",
                  ),
                  _createNominal(),
                  Container(
                    margin: EdgeInsets.only(bottom: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masa Berlaku",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(top: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color(0xffE5E5E5),
                                  ),
                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: startController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Momentumicon.calender,
                                      color: Color(0xff696969),
                                    ),
                                    hintText: "Tanggal Mulai",
                                    hintStyle: TextStyle(
                                      color: Color(0xff696969),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color(0xffE5E5E5),
                                  ),
                                ),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: startController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Momentumicon.calender,
                                      color: Color(0xff696969),
                                    ),
                                    hintText: "Tanggal Berakhir",
                                    hintStyle: TextStyle(
                                      color: Color(0xff696969),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deskripsi Voucher",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xffE5E5E5),
                          ),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          maxLines: 10,
                          controller: descController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15, left: 15),
                            border: InputBorder.none,
                            hintText: "Masukkan deskripsi voucher",
                            hintStyle: TextStyle(
                              color: Color(0xff696969),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(cBlack),
                      elevation: MaterialStateProperty.all<double>(0)),
                  onPressed: () {},
                  child: Text(
                    "Tambahkan Voucher",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
