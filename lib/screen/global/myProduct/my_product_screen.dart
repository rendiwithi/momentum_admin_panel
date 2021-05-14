import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/screen/global/myProduct/addProduct/add_product_screen.dart';
import 'package:momentum_admin_panel/screen/global/myProduct/waiting_approval_body.dart/waitting_approval_body.dart';
import 'package:momentum_admin_panel/widgets/search.dart';

import 'myProcutBody/my_product_body.dart';

class MyProductScreen extends StatefulWidget {
  @override
  _MyProductScreenState createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  Color colorL, colorR;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    MyProductBody(),
    WaittingApprovalBody(),
  ];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(),
              ),
            );
          },
          backgroundColor: Color(0xffE8B730),
          child: Icon(
            Icons.add,
            color: Color(0xff715815),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Produk Saya",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: cBlack,
        ),
        body: Container(
          color: cGrey,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                child: SearchBar(),
              ),
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
                      label: 'Produk Saya',
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
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
