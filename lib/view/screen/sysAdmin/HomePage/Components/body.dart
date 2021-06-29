import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/view/widgets/widget.dart';

class HomePageSysAdminBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      color: cBlack,
                    ),
                    Positioned(
                      top: 70,
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
                                  icon: Momentumicon.warehouse,
                                  title: "Warehouse",
                                  route: '/admin/warehouse',
                                ),
                                CreateWearhouse(
                                  icon: Momentumicon.warehouse,
                                  title: "Stok Online",
                                  route: '/admin/onlinewarehouse',
                                ),
                              ],
                            ),
                            Center(child: CreateDelivery()),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 23,
                      top: 20,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Color(0xff333333)),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Icon(
                                Momentumicon.chat_1,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: -15,
                              right: -15,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Text("99")),
                              ),
                            ),
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
                      icon: Momentumicon.icon_tambah_produk,
                      title: "Tambahkan Produk",
                      data: "",
                      route: '/global/addProduct',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_produk_toko,
                      title: "Produk Toko",
                      data: "251 Produk",
                      route: '/sysadmin/myProduct',
                      isNew: true,
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
                      isNew: true,
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_kelola_banner,
                      title: "Kelola Banner",
                      data: "",
                      route: '/admin/manageBanner',
                      isNew: true,
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_status_pesanan,
                      title: "Status Pesanan",
                      data: "",
                      route: '/global/statusProduct',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_kelola_pegawai,
                      title: "Kelola Pegawai",
                      data: "",
                      route: '/trial',
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_comission,
                      title: "Comission Transfer",
                      data: "",
                      route: '/trial',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(left: 15, right: 15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text("Laporan"),
                    ),
                    CreateMenu(
                      icon: Momentumicon.icon_penjualan,
                      title: "Penjualan",
                      data: "",
                      route: '/sysadmin/income',
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
                      margin: EdgeInsets.only(left: 16), child: QuitButton()),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
