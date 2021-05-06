import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/widgets/search.dart';

class MyProductScreen extends StatefulWidget {
  @override
  _MyProductScreenState createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  Color colorL, colorR;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Produk Saya',
      style: optionStyle,
    ),
    Text(
      'Menunggu Persetujuan',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      (_selectedIndex == 0)?colorL = Color(0xffE8B730): colorL = Colors.white;
      (_selectedIndex == 1)?colorR = Color(0xffE8B730): colorR = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Produk Saya"),
          centerTitle: true,
          backgroundColor: cBlack,
        ),
        body: Container(
          color: cGrey,
          child: ListView(
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
              Container(
                child: Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
