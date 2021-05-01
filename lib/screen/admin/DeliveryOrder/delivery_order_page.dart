import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';
import 'package:momentum_admin_panel/screen/admin/DeliveryOrder/components/body.dart';

class DeliveryOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cBlack,
        centerTitle: true,
        title: Text(
          "Delivery Order",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Momentumicon.filter,
            ),
          )
        ],
      ),
      body: DeliveryOrderBody(),
    );
  }
}
