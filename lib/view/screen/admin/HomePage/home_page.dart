import 'package:flutter/material.dart';

import 'Components/body.dart';
// import 'package:flutter/services.dart';
// import 'package:momentum_admin_panel/constant/colors.dart';

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
