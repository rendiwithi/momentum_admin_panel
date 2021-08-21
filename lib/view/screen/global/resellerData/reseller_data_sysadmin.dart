import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

import 'add_ reseller_page.dart/add_reseller_page.dart';
import 'list_data.dart';

class ResellerDataSysadmin extends StatefulWidget {
  const ResellerDataSysadmin({key}) : super(key: key);

  @override
  _ResellerDataSysadminState createState() => _ResellerDataSysadminState();
}

class _ResellerDataSysadminState extends State<ResellerDataSysadmin> {
  TextEditingController searchController = new TextEditingController();
  int _selectedIndex = 0;
  Color colorL = Color(0xffE8B730), colorR;

  static List<Widget> _widgetOptions = <Widget>[
    ListData(),
    Text("ini menunggu persetujuan"),
    // Text("ini menunggu asd"),
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

  Widget tabSearch() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cGrey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: searchController,
          style: TextStyle(color: Colors.black),
          maxLines: 1,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Momentumicon.search,
              color: Color(0xff696969),
              size: 18,
            ),
            hintText: "Cari reseller",
            hintStyle: TextStyle(
              color: Color(0xff696969),
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: cBlack,
        title: Text(
          "Data Reseller",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddResellerPage(),
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
          tabSearch(),
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
                  label: 'Reseller',
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
    );
  }
}
