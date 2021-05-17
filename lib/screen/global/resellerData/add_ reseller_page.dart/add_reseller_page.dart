import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

class AddResellerPage extends StatefulWidget {
  @override
  _AddResellerPageState createState() => _AddResellerPageState();
}

class _AddResellerPageState extends State<AddResellerPage> {
  int gender = 1;
  TextEditingController nameController,
      phoneController,
      emailController,
      identitiyController;

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
              style: new TextStyle(fontSize: 14.0),
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
        backgroundColor: cGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: cBlack,
          title: Text(
            "Tambahkan Reseller",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _createTextField(
                          name: "Nama Lengkap",
                          hint: "Masukkan nama lengkap",
                          controller: nameController,
                          type: TextInputType.name,
                        ),
                        Text("Nama Lengkap"),
                        Container(
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Color(0xffD4BA4D)),
                            child: Row(
                              children: [
                                _createRadioButton(
                                  title: 'Laki - Laki',
                                  group: gender,
                                  value: 1,
                                ),
                                _createRadioButton(
                                  title: 'Perempuan',
                                  group: gender,
                                  value: 2,
                                )
                              ],
                            ),
                          ),
                        ),
                        _createTextField(
                          name: "Nomor HP",
                          hint: "Masukkan nomor Hp",
                          controller: phoneController,
                          type: TextInputType.phone,
                        ),
                        _createTextField(
                          name: "Email",
                          hint: "Masukkan email",
                          controller: emailController,
                          type: TextInputType.emailAddress,
                        ),
                        _createTextField(
                          name: "Nomor KTP",
                          hint: "Masukkan nomor ktp",
                          controller: identitiyController,
                          type: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    color: cGrey,
                  )
                ],
              ),
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
                    "Tambahkan Teseller",
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
