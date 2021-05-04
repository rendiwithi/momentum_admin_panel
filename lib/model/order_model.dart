import 'package:momentum_admin_panel/model/product_model.dart';

class OrderModel {
  final int id;
  final bool isDelivered, isPrinted;
  final String time, serialCode;
  final String customer, address, phone;
  List<ProductModel> order;

  OrderModel({
    this.id,
    this.isDelivered,
    this.isPrinted,
    this.serialCode,
    this.time,
    this.order,
    this.customer,
    this.address,
    this.phone,
  });
}

var deliveryAdmin = [
  OrderModel(
    id: 0,
    serialCode: "AC9885120098",
    time: "24 Mar 2020 , 10:00",
    isDelivered: true,
    isPrinted: true,
    customer: "Syahru Murtadho",
    address:
        "Jl.Kalibokor Timur no.117 Gubeng , Surabaya, Jawa Timur, Indonesia",
    phone: "+62 813 5078 0012",
    order: [
      ProductModel(
        id: 1,
        stock: 6,
        name: "Scarlett Whitening Body uwu",
        notes:
            "Tolong dicek dulu barangnya sebelum dikirim karena mau di review",
        imgUrl: "https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg",
        isSold: false,
      ),
      ProductModel(
        id: 2,
        stock: 5,
        name: "Scarlett Whitening Body Scrub Romansa Asd2",
        isSold: true,
        notes: "",
        imgUrl:
            "https://id-test-11.slatic.net/p/5/kiss-beauty-bb-mineral-cream-baby-skin-cream-milky-lotion-makeup-base-concealer-foundation-finishing-powder-9659-30947323-e466aa7164002da06cb853c94db597e4-catalog_233.jpg_320x320.jpg",
      ),
    ],
  ),
  OrderModel(
    id: 1,
    serialCode: "AC9885126969",
    time: "24 January 2021 , 11:00",
    isDelivered: false,
    isPrinted: false,
    customer: "Syahru Murtadho",
    address:
        "Jl.Kalibokor Timur no.117 Gubeng , Surabaya, Jawa Timur, Indonesia",
    phone: "+62 813 5078 0012",
    order: [
      ProductModel(
        id: 1,
        stock: 9,
        isSold: true,
        name: "Scarlett Whitening Body Scrub Romansa Asd2",
        notes: "",
        imgUrl: "https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg",
      ),
      ProductModel(
        id: 2,
        stock: 10,
        isSold: false,
        name: "Scarlett Whitening",
        notes: "",
        imgUrl:
            "https://id-test-11.slatic.net/p/5/kiss-beauty-bb-mineral-cream-baby-skin-cream-milky-lotion-makeup-base-concealer-foundation-finishing-powder-9659-30947323-e466aa7164002da06cb853c94db597e4-catalog_233.jpg_320x320.jpg",
      ),
    ],
  ),
];
