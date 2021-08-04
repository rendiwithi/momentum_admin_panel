import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:momentum_admin_panel/model/AddProduct_model/AddProduct_model.dart';
import 'package:momentum_admin_panel/model/AddProduct_model/addImage_model.dart';

class AddProductBody extends StatefulWidget {
  @override
  _AddProductBodyState createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  TextEditingController nameController = new TextEditingController(),
      brandController = new TextEditingController(),
      priceController = new TextEditingController(),
      stockController = new TextEditingController(),
      descController = new TextEditingController(),
      weightController = new TextEditingController();
  File img1, img2, img3, img4;
  AddProduct newProduct;
  AddImage imageStatus;
  final picker = ImagePicker();
  void sendNewProduct() async {
    bool name = nameController.text.isEmpty;
    bool brand = brandController.text.isEmpty;
    bool stock = stockController.text.isEmpty;
    bool desc = descController.text.isEmpty;
    bool price = priceController.text.isEmpty;
    bool weight = weightController.text.isEmpty;
    bool image1 = img1 == null;
    bool image2 = img2 == null;
    bool image3 = img3 == null;
    bool image4 = img4 == null;
    print("=================");
    if (name || brand || stock || desc || price || weight || image1) {
      Fluttertoast.showToast(msg: "Isi Data Yang ada");
    } else {
      print("object");
      await AddProduct.connectToApi(
              name: nameController.text,
              desc: descController.text,
              idBrand: "1",
              idCategory: "1",
              price: priceController.text,
              weight: weightController.text)
          .then((value) => newProduct = value);
      print(newProduct.id);
      print("=================1");

      if (image1 == false && newProduct.code == 200) {
        print("================= SAVE");
        await AddImage.connectToApi(
          id: newProduct.id,
          imgProduct: img1,
        );
        Fluttertoast.showToast(msg: "asd");
      }
      print("================= IMAGE 1");
      if (image2 == false && newProduct.code == 200) {
        print("================= SAVE");
        await AddImage.connectToApi(
          id: newProduct.id,
          imgProduct: img2,
        );
      }
      print("================= IMAGE 2");
      if (image3 == false && newProduct.code == 200) {
        print("================= SAVE");
        await AddImage.connectToApi(
          id: newProduct.id,
          imgProduct: img3,
        );
      }
      print("================= IMAGE 3");

      if (image4 == false && newProduct.code == 200) {
        print("================= SAVE");
        await AddImage.connectToApi(
          id: newProduct.id,
          imgProduct: img4,
        );
      }
      print("================= IMAGE 4");
      Navigator.pop(context);
    }
  }

  Widget _createInputField(
      String title, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xffE5E5E5),
            ),
          ),
          child: TextField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: Color(0xff696969),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createMultiInput() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Harga",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Rp",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff696969),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Harga",
                            hintStyle: TextStyle(
                              color: Color(0xff696969),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Stock",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    controller: stockController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Stock",
                      hintStyle: TextStyle(
                        color: Color(0xff696969),
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

  Widget _createDescInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Deskripsi produk",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xffE5E5E5),
            ),
          ),
          child: TextField(
            style: TextStyle(color: Colors.black),
            maxLines: 10,
            controller: descController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Masukkan deskripsi singkat produk anda",
              hintStyle: TextStyle(
                color: Color(0xff696969),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _takeFoto(String title) {
    return DottedBorder(
      radius: Radius.circular(10),
      color: Color(0xff888888),
      strokeWidth: 1,
      dashPattern: [10, 10, 10, 10],
      child: Container(
        height: 160,
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Momentumicon.camera,
                color: Color(0xff888888),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(0xff888888),
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteImage(int index) {
    if (index == 0) {
      setState(
        () {
          img1 = img2;
          img2 = img3;
          img3 = img4;
          img4 = null;
        },
      );
    } else if (index == 1) {
      setState(
        () {
          img2 = img3;
          img3 = img4;
          img4 = null;
        },
      );
    } else if (index == 2) {
      setState(
        () {
          img3 = img4;
          img4 = null;
        },
      );
    } else if (index == 3) {
      setState(
        () {
          img4 = null;
        },
      );
    }
  }

  getImage(int index) async {
    if (index == 0) {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      Fluttertoast.showToast(msg: pickedFile.toString());
      setState(
        () {
          if (pickedFile != null) {
            img1 = File(pickedFile.path);
          } else {
            print('No image selected.');
          }
        },
      );
    } else if (index == 1) {
      if (img1 != null) {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);
        setState(
          () {
            if (pickedFile != null) {
              img2 = File(pickedFile.path);
            } else {
              print('No image selected.');
            }
          },
        );
      } else {
        Fluttertoast.showToast(
          msg: "Isi Gambar Sebelumnya",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else if (index == 2) {
      if (img1 != null && img2 != null) {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);
        setState(
          () {
            if (pickedFile != null) {
              img3 = File(pickedFile.path);
            } else {
              print('No image selected.');
            }
          },
        );
      } else {
        Fluttertoast.showToast(
          msg: "Isi Gambar Sebelumnya",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else if (index == 3) {
      if (img1 != null && img2 != null && img3 != null) {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);
        setState(
          () {
            if (pickedFile != null) {
              img4 = File(pickedFile.path);
              // Fluttertoast.showToast(msg: PickedFile());
            } else {
              print('No image selected.');
            }
          },
        );
      } else {
        Fluttertoast.showToast(
          msg: "Isi Gambar Sebelumnya",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEFEFEF),
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createInputField(
                      "Nama Produk", "Masukkan nama produk", nameController),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createInputField("Merek", "Merek", brandController),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createMultiInput(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: _createDescInput(),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Berat",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xffE5E5E5),
                          ),
                        ),
                        child: Stack(
                          children: [
                            TextField(
                              style: TextStyle(color: Colors.black),
                              controller: weightController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Berat",
                                hintStyle: TextStyle(
                                  color: Color(0xff696969),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                height: 50,
                                width: 50,
                                color: cGrey,
                                child: Center(child: Text("Gram")),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 10),
              crossAxisCount: 2,
              children: List.generate(
                4,
                (index) {
                  var image;
                  if (index == 0) {
                    image = img1;
                  } else if (index == 1) {
                    image = img2;
                  } else if (index == 2) {
                    image = img3;
                  } else if (index == 3) {
                    image = img4;
                  }
                  return GestureDetector(
                    onTap: () {
                      (image == null) ? getImage(index) : deleteImage(index);
                    },
                    child: Container(
                      height: 160,
                      width: 160,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: (image == null)
                          ? Container(
                              padding: EdgeInsets.all(15),
                              child: _takeFoto("Foto ${index + 1}"),
                            )
                          : Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    image,
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 40,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: Color(0xff4D000000),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Momentumicon.trash,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Fluttertoast.showToast(msg: "Tambahkan Produk");
              sendNewProduct();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: cBlack, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Tambahkan Produk",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
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
