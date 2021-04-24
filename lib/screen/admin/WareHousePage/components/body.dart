import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/widgets/appBarCustom.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/widgets/search.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/widgets/warning.dart';

class WareHouseBody extends StatefulWidget {
  @override
  _WareHouseBodyState createState() => _WareHouseBodyState();
}

class _WareHouseBodyState extends State<WareHouseBody> {
  bool isStockLow = false;
  final List<String> url = [
    "https://s2.bukalapak.com/img/23318517662/s-464-464/data.jpeg",
    "https://id-test-11.slatic.net/p/92644e9ade52899ca050c05caf0c7a59.jpg_320x320.jpg",
    "https://id-test-11.slatic.net/p/5/kiss-beauty-bb-mineral-cream-baby-skin-cream-milky-lotion-makeup-base-concealer-foundation-finishing-powder-9659-30947323-e466aa7164002da06cb853c94db597e4-catalog_233.jpg_320x320.jpg",
  ];
  final List<String> name = [
    'Scarlett Whitening Body Scrub Romansa',
    'Scarlett Whitening Body Scrub Romansa',
    'Scarlett Whitening Body Scrub Romansa',
  ];
  final List<int> stock = [241, 5, 100];
  void isLow() {
    for (var i = 0; i < stock.length; i++) {
      if (stock[i] < 10) {
        isStockLow = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    isLow();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: AppBarCustom(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 60,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SearchBar(),
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
            flex: 8,
            child: ListView.builder(
              itemCount: name.length,
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
                          url[index],
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Stok Barang : ${stock[index]}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff696969),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
