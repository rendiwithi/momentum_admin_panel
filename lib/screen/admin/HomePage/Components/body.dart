import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/screen/admin/HomePage/widget/widget.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                color: cBlack,
                child: Center(
                  child: Image.asset(
                    'assets/logo/logo.png',
                    width: 200,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                bottom: -120,
                left: 15,
                right: 15,
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 150,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Kelola Gudang",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          createWareHouse("Warehouse"),
                          createWareHouse("Stok Online"),
                        ],
                      ),
                      Center(child: createDelivery()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          width: 100,
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text("Produk Kamu"),
              ),
              createMenu(Icons.add_box, "Tambahkan Produk", ""),
              createMenu(Icons.archive, "Produk Toko", "251 Produk"),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text("Lainnya"),
              ),
              createMenu(Icons.add_box, "Ulasan Produk", "4 Ulasan"),
              createMenu(Icons.archive, "Data Resseler", ""),
              createMenu(Icons.archive, "Voucher Kupon", ""),
              createMenu(Icons.archive, "Kelola Banner", ""),
              createMenu(Icons.archive, "Status Pemesanan", ""),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: createMenu(Icons.highlight_off, "Keluar", ""),
        )
      ],
    );
  }
}
