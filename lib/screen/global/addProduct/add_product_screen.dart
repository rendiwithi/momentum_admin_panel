import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/screen/global/addProduct/components/body.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cBlack ,
          centerTitle: true,
          title: Text("Tambahkan Produk"),
        ),
        body: AddProductBody(),
      ),
    );
  }
}
