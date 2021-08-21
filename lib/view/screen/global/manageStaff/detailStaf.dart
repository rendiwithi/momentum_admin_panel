import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

class DetailStaff extends StatefulWidget {
  const DetailStaff({key}) : super(key: key);

  @override
  _DetailStaffState createState() => _DetailStaffState();
}

class _DetailStaffState extends State<DetailStaff> {
  Widget _createProfile(String menu, String profile) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            menu,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff696969)),
          ),
          Text(
            profile,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: cBlack,
              image: DecorationImage(
                image: AssetImage('assets/logo/top_decoration.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo/bottom_decoration.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      print("aaaaaaaaaaaaaa");
                    },
                    icon: Icon(Momentumicon.arrow_left),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.only(left: 8, right: 15),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/6707077/pexels-photo-6707077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "YAGITU YA",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffE8B730),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "YAGITU@GMAIL.COM",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffB3FFFFFF),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Pribadi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      _createProfile("Nama Lengkap", "data.name"),
                      _createProfile("Tanggal Lahir", "data.dateCreated"),
                      _createProfile("Jenis Kelamin", "data.gender"),
                      _createProfile("No Hp", "data.phoneNumber"),
                      _createProfile("Email", "data.email"),
                      _createProfile("No KTP", "data.identityNumber"),
                      _createProfile("Tanggal Masuk", "data.identityNumber"),
                      _createProfile("Alamat Rumah", "data.identityNumber"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Akun Admin",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      _createProfile("Username", "data.bankName"),
                      _createProfile("Password", "data.bankAccountNumber"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi Rekening",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      _createProfile("Nama Bank", "data.bankName"),
                      _createProfile("Nomor Rekening", "data.bankAccountNumber"),
                      _createProfile("Nama Pemilik", "data.bankUser"),
                    ],
                  ),
                ),
              ],
            ),
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
                    "Ubah Informasi",
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
