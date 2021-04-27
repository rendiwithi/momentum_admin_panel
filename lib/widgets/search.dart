import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/icon/Iconku_icons.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            color: Color(0xffF1F1F1),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Cari Produk",
                prefixIcon: Icon(Iconku.search_9),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/trial');
            },
            child: Icon(Iconku.qrcode_scan_1),
          ),
        ),
      ],
    );
  }
}
