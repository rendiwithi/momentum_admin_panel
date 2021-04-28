import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/model/product_model.dart';
import 'package:momentum_admin_panel/widgets/appBarCustom.dart';
import 'package:momentum_admin_panel/widgets/warning.dart';

class WareHouseBody extends StatefulWidget {
  @override
  _WareHouseBodyState createState() => _WareHouseBodyState();
}

class _WareHouseBodyState extends State<WareHouseBody> {
  List<ProductModel> product = [];
  List<ProductModel> productSearch = [];
  bool isStockLow = false;
  TextEditingController searchController = new TextEditingController();
  final List<String> url = [
    "https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg",
    "https://id-test-11.slatic.net/p/92644e9ade52899ca050c05caf0c7a59.jpg_320x320.jpg",
    "https://id-test-11.slatic.net/p/5/kiss-beauty-bb-mineral-cream-baby-skin-cream-milky-lotion-makeup-base-concealer-foundation-finishing-powder-9659-30947323-e466aa7164002da06cb853c94db597e4-catalog_233.jpg_320x320.jpg",
  ];
  final List<String> name = [
    'Scarlett Whitening Body Scrub Romansa Asd2',
    'Scarlett Qwe1',
    'Scarlett Whitening3 Body Scrub Romansa Zxcasd',
  ];

  List<int> stock = [241, 5, 100];
  void isLow() {
    for (var i = 0; i < stock.length; i++) {
      if (stock[i] < 10) {
        isStockLow = true;
      }
    }
  }

  void _getProduct() {
    for (var i = 0; i < name.length; i++) {
      product.add(
        ProductModel(
          name[i],
          url[i],
          stock[i],
          i,
        ),
      );
    }
  }
  Widget _createListViewBuilder(List<ProductModel> model){
    return ListView.builder(
              itemCount: model.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xffEFEFEF),
                    ),
                  )),
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 8,
                    bottom: 8,
                  ),
                  height: 80,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          model[index].imgUrl,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Stok Barang : ${model[index].stock}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                  (model[index].stock < 10)
                                      ? Container(
                                          margin: EdgeInsets.only(left: 13),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.info,
                                                color: Color(0xffF06C22),
                                                size: 13,
                                              ),
                                              Text(
                                                "Perlu restok",
                                                style: TextStyle(
                                                  color: Color(0xffF06C22),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
  }

  @override
  void initState() {
    super.initState();
    isLow();
    _getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBarCustom(
            route: '/admin/warehouse/history',
          ),
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Color(0xffF1F1F1),
                    child: TextField(
                      controller: searchController,
                      onChanged: (String query) {
                        productSearch.clear();
                        String check = searchController.text.toLowerCase();
                        for (var i = 0; i < product.length; i++) {
                          String productArray =
                              product[i].name.toLowerCase();
                          if (productArray.contains(check)) {
                            setState(() {
                              productSearch.add(product[i]);
                            });
                          }
                        }
                        print(searchController.text);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cari Produk",
                        prefixIcon: Icon(Momentumicon.search),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/trial');
                    },
                    child: Icon(Momentumicon.qr),
                  ),
                ),
              ],
            ),
          ),
          (isStockLow == true)
              ? ErrorWarning()
              : Container(
                  height: 5,
                ),
          Container(
            height: 5,
          ),
          Expanded(
            child: (searchController.text != "")
                ? _createListViewBuilder(productSearch)
                : _createListViewBuilder(product),
          ),
        ],
      ),
    );
  }
}
