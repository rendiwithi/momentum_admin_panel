import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/Product_model/detail.dart';
import 'package:momentum_admin_panel/model/Product_model/product.dart';
import 'package:momentum_admin_panel/model/Product_model/update.dart';
import 'package:momentum_admin_panel/view/widgets/appBarCustom.dart';
import 'package:momentum_admin_panel/view/widgets/warning.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class WareHouseOnlineBody extends StatefulWidget {
  // List<Product> productModelOnline;
  // WareHouseOnlineBody({Key key, this.productModelOnline}) : super(key: key);
  @override
  _WareHouseOnlineBodyState createState() => _WareHouseOnlineBodyState();
}

class _WareHouseOnlineBodyState extends State<WareHouseOnlineBody> {
  int id;
  int add = 1;
  String scanId;
  List<Product> productSearch = [];
  bool isStockLow = false, isReady, isModal = false;
  TextEditingController searchController = new TextEditingController();
  TextEditingController addController = new TextEditingController();
  ProductDetail productScan;

  void checkQr(String id) {
    addController.text = add.toString();
    if (productScan.id != "null") isModal = true;
  }

  getData() async {
    await Product.connectToApi(status: "active")
        .then((value) => productModelOnline = value);
  }

  Widget _createListViewBuilder(List<Product> productModelOnline) {
    return ListView.builder(
      itemCount: productModelOnline.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
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
                    productModelOnline[index].imgUrl,
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
                          productModelOnline[index].name,
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
                              "Stok Barang : ${productModelOnline[index].stock}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff696969),
                              ),
                            ),
                            (productModelOnline[index].stock < 20)
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

  Widget _createModal() {
    return SizedBox(
      child: DraggableScrollableSheet(
        maxChildSize: 0.5,
        minChildSize: 0.3,
        builder: (BuildContext c, s) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: ListView(
              controller: s,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0xffE9E9E9),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              productScan.imgURL,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    productScan.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Stok barang saat ini : ${productScan.stock}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Jumlah Penambah",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: (add == 1)
                                      ? () {}
                                      : () {
                                          add = int.parse(addController.text);
                                          add -= 1;
                                          if (add <= 0) add = 1;
                                          setState(() {
                                            addController.text = add.toString();
                                          });
                                        },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: (add == 1)
                                            ? Color(0xffCACACA)
                                            : Color(0xff000000),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: (add == 1)
                                            // Color colorDisable = Color(0xffCACACA);
                                            // Color colorEnable = Color(0xff000000);
                                            ? Color(0xffCACACA)
                                            : Color(0xff000000),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: addController,
                                    // keyboardType: ,
                                    textAlign: TextAlign.center,
                                    onChanged: (newStock) {
                                      if (int.parse(newStock) <= 0) {
                                        add = 1;
                                        addController.text = "1";
                                      } else {
                                        add = int.parse(newStock);
                                      }
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    add = int.parse(addController.text);
                                    add += 1;
                                    setState(() {
                                      addController.text = add.toString();
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff000000),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
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
                                i < productModelOnline.length;
                                i++) {
                              String productArray =
                                  productModelOnline[i].name.toLowerCase();
                              if (productArray.contains(check)) {
                                setState(() {
                                  productSearch.add(productModelOnline[i]);
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
                      child: IconButton(
                        onPressed: () async {
                          var cameraStatus = await Permission.camera.status;
                          if (!cameraStatus.isGranted) {
                            await Permission.camera.request();
                          }
                          if (await Permission.camera.isGranted) {
                            add = 1;
                            scanId = await scanner.scan();
                            if (scanId != null) {
                              Map scan = jsonDecode(scanId);
                              print(scan["id"]);
                              await ProductDetail.connectToApi(
                                id: scan["id"].toString(),
                              ).then((value) => productScan = value);
                              checkQr(scan["id"].toString());
                              setState(() {});
                            }
                          }
                        },
                        icon: Icon(Momentumicon.qr),
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
                child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (productModelOnline == null ||
                          productModelOnline.isEmpty) {
                        return Container(
                          child: Center(
                            child: Text("Loading"),
                          ),
                        );
                      } else {
                        return _createListViewBuilder(productModelOnline);
                      }
                    }),
                // child: (searchController.text != "")
                //     ? _createListViewBuilder(productSearch)
                //     : _createListViewBuilder(productModelOnline),
              ),
            ],
          ),
          if (isModal)
            GestureDetector(
              onTap: () {
                isModal = false;
                setState(() {});
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
              ),
            ),
          if (isModal) _createModal(),
          if (isModal)
            Positioned(
              bottom: 20,
              right: 16,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  add = int.parse(addController.text);
                  ProductUpdate.connectToApi(
                    id: productScan.id,
                    quantity: add.toString(),
                  );
                  isModal = false;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "Tambahkan Stock",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
