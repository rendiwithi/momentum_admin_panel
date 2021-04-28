import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';

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
                prefixIcon: Icon(Momentumicon.search),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/trial');
            },
            child: Icon(Momentumicon.qr),
          ),
        ),
      ],
    );
  }
}
