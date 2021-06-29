
import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/model/product_model.dart';
import 'package:momentum_admin_panel/view/widgets/appBarCustom.dart';
import 'package:momentum_admin_panel/view/widgets/warning.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class WareHouseBody extends StatefulWidget {
  @override
  _WareHouseBodyState createState() => _WareHouseBodyState();
}

class _WareHouseBodyState extends State<WareHouseBody> {
  int id;
  int add = 1;
  String scanId;
  List<ProductModel> productSearch = [];
  bool isStockLow = false, isReady, isModal = false;
  TextEditingController searchController = new TextEditingController();
  List<ProductModel> model = productWarehouseaOffline;
  ProductModel modal;
  void isLow() {
    for (var i = 0; i < model.length; i++) {
      if (model[i].stock < 10) {
        isStockLow = true;
      }
    }
  }

  void checkQr(int id) {
    for (var i = 0; i < model.length; i++) {
      if (model[i].id == id) isReady = true;
      if (model[i].id == id) modal = model[i];
      if (isReady == true) isModal = true;
      if (isReady == true) i = model.length;
    }
  }

  Widget _createListViewBuilder(List<ProductModel> model) {
    return ListView.builder(
      itemCount: model.length,
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

  Widget _createModal(ProductModel modal) {
    return Stack(
      children: [
        WareHouseBody(),
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
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
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
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          modal.imgUrl,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                modal.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Stok barang saat ini : ${modal.stock}",
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
                ),
                Expanded(
                  flex: 1,
                  child: Row(
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
                                      setState(() {
                                        add -= 1;
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
                            Text(
                              add.toString(),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  add += 1;
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
                ),
                GestureDetector(
                  onTap: () {
                    modal.stock = modal.stock + add;
                    isModal = false;
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
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
              ],
            ),
          ),
        ),
      ],
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
                            for (var i = 0; i < model.length; i++) {
                              String productArray = model[i].name.toLowerCase();
                              if (productArray.contains(check)) {
                                setState(() {
                                  productSearch.add(model[i]);
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
                          print(cameraStatus);
                          if (!cameraStatus.isGranted) {
                            await Permission.camera.request();
                          }
                          if (await Permission.camera.isGranted) {
                            isReady = false;
                            add = 1;
                            scanId = await scanner.scan();
                            id = int.parse(scanId);
                            checkQr(id);
                            setState(() {});
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
                child: (searchController.text != "")
                    ? _createListViewBuilder(productSearch)
                    : _createListViewBuilder(model),
              ),
            ],
          ),
          if (isModal) _createModal(modal),
        ],
      ),
    );
  }
}
