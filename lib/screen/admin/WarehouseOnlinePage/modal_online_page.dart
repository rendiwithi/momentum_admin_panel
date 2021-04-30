import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/model/product_model.dart';
import 'package:momentum_admin_panel/screen/admin/WareHousePage/components/body.dart';

// ignore: must_be_immutable
class ModalOnlinePage extends StatefulWidget {
  int id;
  ModalOnlinePage({Key key, @required this.id}) : super(key: key);

  @override
  _ModalOnlinePageState createState() => _ModalOnlinePageState();
}

class _ModalOnlinePageState extends State<ModalOnlinePage> {
  int add = 1;
  Color colorDisable = Color(0xffCACACA);
  Color colorEnable = Color(0xff000000);
  @override
  Widget build(BuildContext context) {
    ProductModel model = productWarehouseaOnline[widget.id];
    return Scaffold(
      body: Stack(
        children: [
          WareHouseBody(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin/warehouse');
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
                                          ? colorDisable
                                          : colorEnable,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: (add == 1)
                                          ? colorDisable
                                          : colorEnable,
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
                                      color: colorEnable,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: colorEnable,
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
                      model.stock = model.stock + add;
                      Navigator.pushReplacementNamed(
                          context, '/admin/warehouse');
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
      ),
    );
  }
}
