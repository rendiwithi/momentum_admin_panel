import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/components/body.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/model/product_model.dart';

// ignore: must_be_immutable
class ModalPage extends StatefulWidget {
  int id;
  ModalPage({Key key, @required this.id}) : super(key: key);

  @override
  _ModalPageState createState() => _ModalPageState();
}

class _ModalPageState extends State<ModalPage> {
  int add;
  @override
  Widget build(BuildContext context) {
    ProductModel model = productWarehouseaOffline[widget.id];
    return Scaffold(
      body: Stack(
        children: [
          WareHouseBody(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black26,
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
                            model.imgUrl,
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
                                  model.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Stok barang saat ini : ${model.stock}",
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
                        Text(
                          "Jumlah Penambah",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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
          // SizedBox.expand(
          //   child: DraggableScrollableSheet(
          //     builder:
          //         (BuildContext context, ScrollController scrollController) {
          //       return Container(
          //         color: Colors.white,
          //         child: ListView(
          //           controller: scrollController,
          //           children: [

          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
