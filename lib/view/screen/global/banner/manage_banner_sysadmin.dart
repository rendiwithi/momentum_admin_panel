import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/view/screen/global/banner/bannerList.dart';

class ManageBannerSysadmin extends StatefulWidget {
  const ManageBannerSysadmin({key}) : super(key: key);

  @override
  _ManageBannerSysadminState createState() => _ManageBannerSysadminState();
}

class _ManageBannerSysadminState extends State<ManageBannerSysadmin> {
  TextEditingController searchController = new TextEditingController();
  int _selectedIndex = 0;
  Color colorL = Color(0xffE8B730), colorR;

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

  static List<Widget> _widgetOptions = <Widget>[
    BannerList(),
    Text("ini menunggu persetujuan"),
  ];
  

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
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
