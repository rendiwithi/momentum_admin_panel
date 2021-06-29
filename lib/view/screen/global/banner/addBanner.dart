import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

class AddBanner extends StatefulWidget {
  @override
  _AddBannerState createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  TextEditingController nameController, linkController;
  int gender = 1;

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
          Text(name),
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
          gender = value;
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
                    gender = value;
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
                  margin: EdgeInsets.only(top: 5),
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
                        controller: linkController,
                        hint: "Masukkan link banner",
                        name: "Link Banner",
                        type: TextInputType.text,
                      ),
                      Text("data"),
                      Row(
                        children: [
                          _createRadioButton(
                              group: gender, title: "Popup", value: 1),
                          _createRadioButton(
                              group: gender, title: "Home Banner", value: 2),
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
                  onPressed: () {},
                  child: Text(
                    "Tambahkan Banner",
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
    );
  }
}
