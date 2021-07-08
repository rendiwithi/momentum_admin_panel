import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/TextStyleCustom.dart';
import 'package:momentum_admin_panel/view/widgets/top_menu.dart';
import 'package:momentum_admin_panel/view/widgets/widget.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topMenu(),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "Produk Kamu",
                        style: titleBold,
                      ),
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_tambah_produk,
                      title: "Tambahkan Produk",
                      data: "",
                      route: '/global/addProduct',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_produk_toko,
                      title: "Produk Toko",
                      data: "251 Produk",
                      route: '/admin/myProduct',
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
                      child: Text(
                        "Lainnya",
                        style: titleBold,
                      ),
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_ulasan_produk,
                      title: "Ulasan Produk",
                      data: "4 Ulasan",
                      route: '/global/productReview',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_data_reseller,
                      title: "Data Reseller",
                      data: "",
                      route: '/global/ResellerData',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_voucher_kupon,
                      title: "Voucher Kupon",
                      data: "",
                      route: '/global/addVoucher',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_kelola_banner,
                      title: "Kelola Banner",
                      data: "",
                      route: '/admin/manageBanner',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_status_pesanan,
                      title: "Status Pesanan",
                      data: "",
                      route: '/global/statusProduct',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: QuitButton(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  } 
}
