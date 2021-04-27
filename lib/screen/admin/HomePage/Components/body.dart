import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/icon/Iconku_icons.dart';
import 'package:momentum_admin_panel/widgets/widget.dart';

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
                                  icon: Iconku.warehouse,
                                  title: "Warehouse",
                                  route: '/admin/warehouse',
                                ),
                                CreateWearhouse(
                                  icon: Iconku.warehouse,
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
                      icon: Iconku.icon_tambah_produk,
                      title: "Tambahkan Produk",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Iconku.icon_produk_toko,
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
                      icon: Iconku.icon_ulasan_produk,
                      title: "Ulasan Produk",
                      data: "4 Ulasan",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Iconku.icon_data_reseller,
                      title: "Data Reseller",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Iconku.icon_voucher_kupon,
                      title: "Voucher Kupon",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Iconku.icon_kelola_banner,
                      title: "Kelola Banner",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Iconku.icon_status_pesanan,
                      title: "Status Pesanan",
                      data: "",
                      route: '/trial',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(margin: EdgeInsets.only(left: 16), child: QuitButton()),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
