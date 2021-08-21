import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/AddProduct_model/AddProduct_model.dart';
import 'package:momentum_admin_panel/model/Product_model/product.dart';

class WaittingApprovalBody extends StatefulWidget {
  @override
  _WaittingApprovalBodyState createState() => _WaittingApprovalBodyState();
}

class _WaittingApprovalBodyState extends State<WaittingApprovalBody> {
  getData() async {
    await Product.connectToApi(status: "pending")
        .then((value) => productModelPending = value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (productModelPending == null || productModelPending.isEmpty) {
            return Container(
              child: Center(
                child: Text("Loading"),
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(top: 1, bottom: 5),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: productModelPending.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    productModelPending[index].imgUrl,
                                    height: 55,
                                    width: 55,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5, left: 15),
                                    height: 55,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          productModelPending[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Stok Barang : ${productModelPending[index].stock}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff696969),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                PopupMenuButton(
                                  child: Icon(Icons.more_horiz),
                                  onSelected: (value) {
                                    print("value:$value");
                                    actionPopUpChangeStatus(
                                      product: productModelPending[index],
                                      value: value,
                                    );
                                    setState(() {
                                      
                                    });
                                  },
                                  itemBuilder: (context) {
                                    return <PopupMenuEntry>[
                                      PopupMenuItem(
                                        height: 35,
                                        value: 'active',
                                        child: Text('Setuju & Terbitkan'),
                                      ),
                                      PopupMenuDivider(),
                                      PopupMenuItem(
                                        height: 35,
                                        value: 'pending',
                                        child: Text('Belum Disetujui'),
                                      )
                                    ];
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 55,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 30, right: 15, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rp ${productModelPending[index].price}",
                                        style: TextStyle(
                                          color: Color(0xffE8B730),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.verified_user,
                                            color: Color(0xff7D8487),
                                            size: 18,
                                          ),
                                          Text(
                                            "Menunggu Divalidasi",
                                            style: TextStyle(
                                              color: Color(0xff7D8487),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xffEFEFEF),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }
        });
  }
}

changeStatus({Product product, String status}) async {
  await AddProduct.changeStatus(
    name: product.name,
    id: product.id.toString(),
    idBrand: product.idBrand.toString(),
    idCategory: product.idCategory.toString(),
    price: product.price.toString(),
    status: status,
  );
  // idBrand: brandId.toString(),
  // idCategory: categoryId.toString(),
  // price: priceController.text,
  // weight: weightController.text)
  // .then((value) => newProduct = value);
}

void actionPopUpChangeStatus({String value, Product product}) {
  String message;
  if (value == 'active') {
    message = 'active ${product.id}';
  } else if (value == 'pending') {
    message = 'pending  ${product.id}';
  } else {
    message = 'Not implemented';
  }
  changeStatus(product: product, status: value);
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    // timeInSecForIos: 1,
  );
}
