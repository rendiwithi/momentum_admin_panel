import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/screen/admin/HomePage/widget/widget.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                child: Stack(
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
                      top: 120,
                      right: 10,
                      left: 10,
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
                                CreateWearhouse(
                                  icon: Icons.widgets,
                                  title: "Warehouse",
                                  route: '/admin/warehouse',
                                ),
                                CreateWearhouse(
                                  icon: Icons.widgets,
                                  title: "Stok Online",
                                  route: '/trial',
                                ),
                              ],
                            ),
                            Center(child: CreateDelivery()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                    CreateMenu(
                      icon: Icons.add_box,
                      title: "Tambahkan Produk",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Icons.archive,
                      title: "Produk Toko",
                      data: "251 Produk",
                      route: '/trial',
                    ),
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
                    CreateMenu(
                      icon: Icons.add_box,
                      title: "Ulasan Produk",
                      data: "4 Ulasan",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Icons.archive,
                      title: "Data Reseller",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Icons.archive,
                      title: "Voucher Kupon",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Icons.archive,
                      title: "Kelola Banner",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Icons.archive,
                      title: "Status Pesanan",
                      data: "",
                      route: '/trial',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: QuitButton(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
