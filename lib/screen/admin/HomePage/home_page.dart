import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/screen/admin/HomePage/Components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: cBlack,
    // ));
    return Scaffold(
      body: HomePageBody(),
    );
  }
}
