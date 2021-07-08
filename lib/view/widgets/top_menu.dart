import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/constant/TextStyleCustom.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/view/widgets/widget.dart';
import 'package:flutter/material.dart';
Widget topMenu() {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 150,
            color: cBlack,
            child: Center(
              child: Image.asset(
                'assets/logo/logo.png',
                width: 200,
                height: 50,
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 150,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Kelola Gudang",
                      style: titleBold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CreateWearhouse(
                        icon: Momentumicon.warehouse,
                        title: "Warehouse",
                        route: '/admin/warehouse',
                      ),
                      CreateWearhouse(
                        icon: Momentumicon.warehouse,
                        title: "Stok Online",
                        route: '/admin/onlinewarehouse',
                      ),
                    ],
                  ),
                  Center(child: CreateDelivery()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }