import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';
import 'package:dotted_border/dotted_border.dart';

class AddProductBody extends StatefulWidget {
  @override
  _AddProductBodyState createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  TextEditingController nameController,
      brandController,
      priceController,
      stockController,
      descController,
      heightController;
  Widget _createInputField(
      String title, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xffE5E5E5),
            ),
          ),
          child: TextField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: Color(0xff696969),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createMultiInput() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Harga",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Rp",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff696969),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Harga",
                            hintStyle: TextStyle(
                              color: Color(0xff696969),
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
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Stock",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    controller: stockController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Stock",
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
      ],
    );
  }

  Widget _createDescInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Deskripsi produk",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
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
            controller: descController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Masukkan deskripsi singkat produk anda",
              hintStyle: TextStyle(
                color: Color(0xff696969),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _takeFoto(String title) {
    return DottedBorder(
      radius: Radius.circular(10),
      color: Color(0xff888888),
      strokeWidth: 1,
      dashPattern: [10, 10, 10, 10],
      child: Container(
        height: 160,
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Momentumicon.camera,
                color: Color(0xff888888),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(0xff888888),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _setFoto() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            height: 160,
            width: 160,
            image: NetworkImage(
              'https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg',
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 40,
            width: 160,
            decoration: BoxDecoration(
              color: Color(0xff4D000000),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Momentumicon.trash,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEFEFEF),
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createInputField(
                      "Nama Produk", "Masukkan nama produk", nameController),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createInputField("Merek", "Merek", brandController),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createMultiInput(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createDescInput(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createInputField("Berat", "Berat", heightController),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Foto Produk",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 160,
                              width: 160,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: _setFoto()),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: _takeFoto("Foto 2"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: _takeFoto("Foto 3"),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: _takeFoto("Foto 4"),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: cBlack, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Tambahkan Produk",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
