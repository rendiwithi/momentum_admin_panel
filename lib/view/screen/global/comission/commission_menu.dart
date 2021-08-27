import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:flutter/material.dart';
import 'commision_list.dart';
import 'history_list.dart';

class ComissionTransfer extends StatefulWidget {
  const ComissionTransfer({key}) : super(key: key);

  @override
  _ComissionTransferState createState() => _ComissionTransferState();
}

class _ComissionTransferState extends State<ComissionTransfer> {
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
    ComissionList(),
    HistoryList()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cBlack,
        centerTitle: true,
        title: Text(
          "Comission Transfer",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
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
                  label: 'Comission List',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'History Transfer',
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
