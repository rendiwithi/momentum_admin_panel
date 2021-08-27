import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/model/banner/add_banner_image.dart';
import 'package:momentum_admin_panel/model/banner/new_banner.dart';

class AddBanner extends StatefulWidget {
  @override
  _AddBannerState createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  TextEditingController nameController = new TextEditingController(),
      linkController = new TextEditingController(),
      descController = new TextEditingController();
  int type = 1;
  File image;
  NewBanner newBanner;
  final picker = ImagePicker();

  Widget _createTextField({
    String name,
    String hint,
    TextEditingController controller,
    TextInputType type,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xffE5E5E5),
              ),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Color(0xff696969),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRadioButton({
    String title,
    int group,
    int value,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          type = value;
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 35,
              child: Radio(
                activeColor: Color(0xffD4BA4D),
                value: value,
                groupValue: group,
                onChanged: (value) {
                  setState(() {
                    type = value;
                  });
                },
              ),
            ),
            Text(
              title,
              style: new TextStyle(
                fontSize: 14.0,
                color: Color(0xff313131),
              ),
            ),
          ],
        ),
      ),
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

  void sendData()async  {
    bool n = nameController.text?.trim()?.isEmpty ?? true;
    bool d = descController.text?.trim()?.isEmpty ?? true;
    bool l = linkController.text?.trim()?.isEmpty ?? true;
    String msg;
    print("object");
    if (n || d || l || image == null) {
      msg = "EH KETEKEN KAMPRET";
    } else {
      await NewBanner.connectToApi(
        title: nameController.text,
        desc: descController.text,
        link: linkController.text,
      ).then((value) => newBanner = value);
      AddBannerImage.connectToApi(
        id: newBanner.id,
        imgBanner: image,
      );
      // await AddNewBanner.connectToApi(
      //     title: nameController.text,
      //     desc: descController.text,
      //     link: linkController.text,
      //     imgProduct: image);
      msg = newBanner.id.toString();
      // Navigator.pop(context);
      Navigator.pop(context);
    }
    print(msg);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tambahkan Banner",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: cBlack,
        ),
        backgroundColor: cGrey,
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 70),
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _createTextField(
                        controller: nameController,
                        hint: "Masukkan Nama Banner",
                        name: "Nama Banner",
                        type: TextInputType.text,
                      ),
                      _createTextField(
                        controller: descController,
                        hint: "Masukkan Description Banner",
                        name: "Description Banner",
                        type: TextInputType.text,
                      ),
                      _createTextField(
                        controller: linkController,
                        hint: "Masukkan link banner",
                        name: "Link Banner",
                        type: TextInputType.text,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gambar",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (image == null) {
                                final pickedFile = await picker.pickImage(
                                    source: ImageSource.gallery);
                                Fluttertoast.showToast(
                                    msg: pickedFile.toString());
                                setState(
                                  () {
                                    if (pickedFile != null) {
                                      image = File(pickedFile.path);
                                    } else {
                                      print('No image selected.');
                                    }
                                  },
                                );
                              } else {
                                image = null;
                                setState(() {});
                              }
                              print("keteken");
                            },
                            child: Center(
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
                                        child: _takeFoto("Foto"),
                                      )
                                    : Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.file(
                                              image,
                                              height: 160,
                                              width: 160,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              height: 40,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                color: Color(0xff4D000000),
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Penempatan Banner",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          _createRadioButton(
                              group: type, title: "Popup", value: 1),
                          _createRadioButton(
                              group: type, title: "Home Banner", value: 2),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(cBlack),
                      elevation: MaterialStateProperty.all<double>(0)),
                  onPressed: () {
                    sendData();
                    print("newBanner.id");
                  },
                  child: Text(
                    "Tambahkan Banner",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
