import 'package:flutter/material.dart';

Widget createWareHouse(String title) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 144,
      height: 45,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
            Color(0xff000000),
            Color(0xff434343),
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.widgets,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget createDelivery() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 144,
      height: 25,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Color(0xff37474F),
          ),
          Text(
            "Delivery Order",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff37474F),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget createMenu(IconData icon, String title, String data) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      height: 40,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Color(0xff37474F),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff37474F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(data, style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
