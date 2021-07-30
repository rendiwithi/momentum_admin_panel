class Order {
  String name;
  String total;
  String imgUrl;
  Order({
    this.name,
    this.total,
    this.imgUrl,
  });

  factory Order.fromJson(Map<String, dynamic> object) {
    return Order(
      name: object["product_name"],
      total: object["quantity"].toString(),
      imgUrl: object["product"]["pictures"][0]["link"]
    );
  }
}
