import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/constant/data.dart';
import 'package:momentum_admin_panel/model/voucher_model/voucher.dart';
import 'package:momentum_admin_panel/view/screen/global/voucher/add_voucher.dart';

class VoucherDiskonSysadmin extends StatefulWidget {
  const VoucherDiskonSysadmin({key}) : super(key: key);

  @override
  _VoucherDiskonSysadminState createState() => _VoucherDiskonSysadminState();
}

class _VoucherDiskonSysadminState extends State<VoucherDiskonSysadmin> {
  int _selectedIndex = 0;
  Color colorL = Color(0xffE8B730), colorR;
  getData() async {
    await Voucher.connectToApi(status: "active")
        .then((value) => voucherDataActive = value);
    await Voucher.connectToApi(status: "pending")
        .then((value) => voucherDataPending = value);
    print(voucherDataActive.length);
    print(voucherDataPending.length);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      (_selectedIndex == 0)
          ? colorL = Color(0xffE8B730)
          : colorL = Colors.white;
      (_selectedIndex == 1)
          ? colorR = Color(0xffE8B730)
          : colorR = Colors.white;
    });
  }

  // static List<Widget> _widgetOptions = [
  //   voucherCard(data: voucherDataActive),
  //   voucherCard(
  //     data: voucherDataPending,
  //   ),
  //   // Text(voucherDataActive.length.toString()),
  //   // Text("ini menunggu persetujuan"),
  // ];

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: cBlack,
        title: Text(
          "Voucher Kupon",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddVoucher(),
              ));
        },
        backgroundColor: Color(0xffE8B730),
        child: Icon(
          Icons.add,
          color: Color(0xff715815),
        ),
      ),
      backgroundColor: cGrey,
      body: Column(
        children: [
          Container(
            height: 50,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              backgroundColor: Colors.white,
              elevation: 0,
              selectedItemColor: Color(0xffE8B730),
              iconSize: 0,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Voucher Kupon',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Menunggu Persetujuan',
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(height: 3, color: colorL),
              ),
              Expanded(
                flex: 1,
                child: Container(height: 3, color: colorR),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: Text("Loading"),
                      ),
                    );
                  } else if (voucherDataActive == null ||
                      voucherDataPending == null) {
                    return Container(
                      child: Center(
                        child: Text("Data Kosong"),
                      ),
                    );
                  } else {
                    return Container(
                      // child: _widgetOptions.elementAt(_selectedIndex),
                      child: (_selectedIndex == 0)? voucherCard(data: voucherDataActive): voucherCard(data: voucherDataPending),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

Widget voucherCard({List<Voucher> data}) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      Voucher model = data[index];
      return Container(
        margin: EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
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
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Text(
                model.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
              ),
              child: Text(
                "${(model.expired)}",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffE8B730),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: cGrey,
            ),
            Container(
              height: 45,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        model.views,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff696969),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 1,
                    color: cGrey,
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified_user,
                          //perbaikan
                          color: (model.status == "active")
                              ? Color(0xff228DF0)
                              : Color(0xff7D8487),
                          size: 18,
                        ),
                        Text(
                          (model.status == "active")
                              ? "Diterbitkan"
                              : "Menunggu Divalidasi",
                          style: TextStyle(
                            color: (model.status == "active")
                                ? Color(0xff228DF0)
                                : Color(0xff7D8487),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
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
