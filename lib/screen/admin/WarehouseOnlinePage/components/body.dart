import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';
import 'package:momentum_admin_panel/model/product_model.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/modal_page.dart';
import 'package:momentum_admin_panel/screen/admin/WarehouseOnlinePage/warehouse_online_page.dart';
import 'package:momentum_admin_panel/widgets/appBarCustom.dart';
import 'package:momentum_admin_panel/widgets/warning.dart';
import 'package:qrscan/qrscan.dart' as scanner;


class WareHouseOnlineBody extends StatefulWidget {
  @override
  _WareHouseOnlineBodyState createState() => _WareHouseOnlineBodyState();
}

class _WareHouseOnlineBodyState extends State<WareHouseOnlineBody> {
  int id;
  String scanId;
  List<ProductModel> productSearch = [];
  bool isStockLow = false, isReady = false;
  TextEditingController searchController = new TextEditingController();

  void isLow() {
    for (var i = 0; i < productWarehouseaOnline.length; i++) {
      if (productWarehouseaOnline[i].stock < 10) {
        isStockLow = true;
      }
    }
  }

  void checkQr(int id) {
    for (var i = 0; i < productWarehouseaOnline.length; i++) {
      (productWarehouseaOffline[i].id == id) ? isReady = true : isReady = false;
    }
  }

  Widget _createListViewBuilder(List<ProductModel> model) {
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ModalPage(id: model[index].id)),
            );
          },
          child: Container(
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
          ),
        );
      },
    );
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
                        for (var i = 0;
                            i < productWarehouseaOnline.length;
                            i++) {
                          String productArray =
                              productWarehouseaOnline[i].name.toLowerCase();
                          if (productArray.contains(check)) {
                            setState(() {
                              productSearch.add(productWarehouseaOnline[i]);
                            });
                          }
                        }
                        // print(searchController.text);
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
                    onTap: () async {
                      scanId = await scanner.scan();
                      id = int.parse(scanId);
                      checkQr(id);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (isReady == true)
                              ? ModalPage(id: id)
                              : WareHouseOnlinePage(),
                        ),
                      );
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
                : _createListViewBuilder(productWarehouseaOffline),
          ),
        ],
      ),
    );
  }
}
