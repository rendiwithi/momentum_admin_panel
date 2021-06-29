import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';

class AppBarCustom extends StatefulWidget {
    final String route;

  const AppBarCustom({Key key, this.route}) : super(key: key);
  @override
  _AppBarCustomState createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: cBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Momentumicon.arrow_left,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Lokasi Cabang",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Momentumicon.location,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      "Surabaya - Jl Kalibokor tim ...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, widget.route);
              },
              child: Icon(Momentumicon.reload, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
