import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/view/screen/global/manageStaff/addStaff.dart';
import 'package:momentum_admin_panel/view/screen/global/manageStaff/detailStaf.dart';

class ManageStaff extends StatefulWidget {
  const ManageStaff({key}) : super(key: key);

  @override
  _ManageStaffState createState() => _ManageStaffState();
}

class _ManageStaffState extends State<ManageStaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kelola Pegawai",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: cBlack,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStaff(),
            ),
          );
        },
        elevation: 0,
        backgroundColor: Color(0xffE8B730),
        child: Icon(
          Icons.add,
          color: Color(0xff715815),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Container(
              color: Color(0xffF1F1F1),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cari Produk",
                  prefixIcon: Icon(Momentumicon.search),
                ),
              ),
            ),
          ),
          // Pegawai
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // print("object ${index}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailStaff(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 4),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 4, right: 4),
                          height: 80,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://images.pexels.com/photos/6707077/pexels-photo-6707077.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                                        ),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "Rendi Dwi H",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: cBlack,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          "Tanggal masuk : 17 Agustus 2021",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Color(0xff696969),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: PopupMenuButton(
                                  child: Icon(Icons.more_horiz),
                                  onSelected: (value) {
                                    print("value:$value");
                                    actionPopUpItemSelected(value);
                                  },
                                  itemBuilder: (context) {
                                    return <PopupMenuEntry>[
                                      PopupMenuItem(
                                        height: 35,
                                        value: 'change',
                                        child: Text('Ubah'),
                                      ),
                                      PopupMenuDivider(),
                                      PopupMenuItem(
                                        height: 35,
                                        value: 'delete',
                                        child: Text('Hapus'),
                                      )
                                    ];
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Status Pegawai : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              // Text(
                              //   "Tidak Aktif",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 14,
                              //     color: Color(0xff696969),
                              //   ),
                              // ),
                              Text(
                                "Aktif",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

void actionPopUpItemSelected(String value) {
  String message;
  if (value == 'change') {
    message = 'You change';
  } else if (value == 'delete') {
    message = 'You delete';
  } else {
    message = 'Not implemented';
  }
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    // timeInSecForIos: 1,
  );
}
