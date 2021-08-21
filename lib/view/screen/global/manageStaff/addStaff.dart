import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({key}) : super(key: key);

  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  int gender = 1;
  bool _obscureText = true;
  TextEditingController nameController;
  TextEditingController birthController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController identityNumberController;
  TextEditingController dateJoinController;
  TextEditingController addressController;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _createTextField({
    String name,
    String hint,
    TextEditingController controller,
    TextInputType type,
    bool withIcon = false,
    IconData iconData,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
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
            child: (withIcon)
                ? TextField(
                    style: TextStyle(color: Colors.black),
                    controller: controller,
                    keyboardType: type,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      border: InputBorder.none,
                      hintText: hint,
                      prefixIcon: Icon(
                        iconData,
                        size: 18,
                      ),
                      hintStyle: TextStyle(
                        color: Color(0xff696969),
                      ),
                    ),
                  )
                : TextField(
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

  Widget _createPasswordTextField({
    String name,
    String hint,
    TextEditingController controller,
    TextInputType type,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
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
              textAlignVertical: TextAlignVertical.center,
              obscureText: _obscureText,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                border: InputBorder.none,
                hintText: hint,
                suffixIcon: IconButton(
                  icon: Icon(
                    (_obscureText) ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                  ),
                  onPressed: _toggle,
                ),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tambahkan Pegawai",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: cBlack,
      ),
      backgroundColor: cGrey,
      body: ListView(
        children: [
          _createTextField(
            hint: "Masukkan nama lengkap",
            controller: nameController,
            name: "Nama Lengkap",
            type: TextInputType.name,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenis Kelamin",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Color(0xffD4BA4D)),
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
              ],
            ),
          ),
          _createTextField(
            name: "Tanggal Lahir",
            controller: birthController,
            hint: "DD/MM/YYYY",
            type: TextInputType.datetime,
            withIcon: true,
            iconData: Momentumicon.calender,
          ),
          _createTextField(
            name: "Nomor HP",
            controller: phoneController,
            hint: "Masukkan nomor hp",
            type: TextInputType.phone,
          ),
          _createTextField(
            name: "Email",
            controller: emailController,
            hint: "Masukkan email",
            type: TextInputType.emailAddress,
          ),
          _createTextField(
            name: "Nomor KTP",
            controller: identityNumberController,
            hint: "Masukkan nomor ktp",
            type: TextInputType.number,
          ),
          _createTextField(
            name: "Tanggal Masuk",
            controller: dateJoinController,
            hint: "DD/MM/YYYY",
            type: TextInputType.datetime,
            withIcon: true,
            iconData: Momentumicon.calender,
          ),
          _createTextField(
            name: "Alamat Lengkap",
            controller: addressController,
            hint: "Masukkan alamat lengkap",
            type: TextInputType.streetAddress,
            withIcon: true,
            iconData: Momentumicon.maps,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            color: Colors.white,
            child: Text(
              "Informasi Akun Admin",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _createTextField(
            name: "Username",
            controller: addressController,
            hint: "Buat Username Baru",
            type: TextInputType.name,
          ),
          _createPasswordTextField(
            name: "Password",
            controller: addressController,
            hint: "Buat Username Baru",
            type: TextInputType.name,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
              bottom: 10,
            ),
            color: Colors.white,
            child: Text(
              "Informasi Rekening",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _createTextField(
            name: "Nama Rekening",
            controller: addressController,
            hint: "BCA",
            type: TextInputType.name,
          ),
          _createTextField(
            name: "Nomor Rekening",
            controller: addressController,
            hint: "767234778222",
            type: TextInputType.name,
          ),
          _createTextField(
            name: "Nama Pemilik",
            controller: addressController,
            hint: "Syahru Murtadho",
            type: TextInputType.name,
          ),
          Container(
            color: Colors.white,
            height: 80,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                print("000000000000000000000000000");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: cBlack,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    "Tambahkan Pegawai",
                    style: TextStyle(color: Colors.white),
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
