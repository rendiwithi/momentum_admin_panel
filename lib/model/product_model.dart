class ProductModel {
  final String name;
  final String imgUrl;
  String notes;
  int stock;
  bool isSold;
  final int id;

  ProductModel({
    this.id,
    this.stock,
    this.notes,
    this.name,
    this.isSold,
    this.imgUrl,
  });
}

var productWarehouseaOffline = [
  ProductModel(
    id: 0,
    stock: 60,
    name: "Scarlett Whitening Body Scrub Romansa Asd2",
    imgUrl: "https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg",
  ),
  ProductModel(
    id: 1,
    stock: 5,
    name: "Scarlett Qwe1",
    imgUrl:
        "https://id-test-11.slatic.net/p/92644e9ade52899ca050c05caf0c7a59.jpg_320x320.jpg",
  ),
  ProductModel(
    id: 2,
    stock: 5,
    name: "Scarlett Whitening3 Body Scrub Romansa Zxcasd",
    imgUrl:
        "https://id-test-11.slatic.net/p/5/kiss-beauty-bb-mineral-cream-baby-skin-cream-milky-lotion-makeup-base-concealer-foundation-finishing-powder-9659-30947323-e466aa7164002da06cb853c94db597e4-catalog_233.jpg_320x320.jpg",
  ),
];
