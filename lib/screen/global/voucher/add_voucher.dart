import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

class AddVoucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Voucher Kupon",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: cBlack,
        ),
      ),
    );
  }
}
