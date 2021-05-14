import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/widgets/search.dart';

import 'addProduct/add_product_screen.dart';
import 'myProcutBody/my_product_body.dart';

class MyProductAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(),
              ),
            );
          },
          backgroundColor: Color(0xffE8B730),
          child: Icon(
            Icons.add,
            color: Color(0xff715815),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Produk Saya",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: cBlack,
        ),
        body: Container(
          color: cGrey,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                child: SearchBar(),
              ),
              Expanded(
                child: MyProductBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
