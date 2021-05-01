import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';

class CreateWearhouse extends StatefulWidget {
  final IconData icon;
  final String title;
  final String route;
  const CreateWearhouse({Key key, this.icon, this.title, this.route})
      : super(key: key);

  @override
  _CreateWearhouseState createState() => _CreateWearhouseState();
}

class _CreateWearhouseState extends State<CreateWearhouse> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.route);
      },
      child: Container(
        width: 145,
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
              widget.icon,
              color: Colors.white,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateDelivery extends StatefulWidget {
  @override
  _CreateDeliveryState createState() => _CreateDeliveryState();
}

class _CreateDeliveryState extends State<CreateDelivery> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/admin/order');
      },
      child: Container(
        width: 144,
        height: 25,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
               Momentumicon.icon_delivery_order,
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
}

class CreateMenu extends StatefulWidget {
  final IconData icon;
  final String title;
  final String data;
  final String route;
  CreateMenu({Key key, this.icon, this.title, this.data, this.route})
      : super(key: key);
  @override
  _CreateMenuState createState() => _CreateMenuState();
}

class _CreateMenuState extends State<CreateMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.route);
      },
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
                      widget.icon,
                      color: Color(0xff37474F),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff37474F),
                        ),
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
                  Text(
                    widget.data,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        height: 40,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
               Momentumicon.out,
              color: Color(0xffBA2121),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                "Keluar",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffBA2121),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
