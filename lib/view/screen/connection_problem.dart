import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnectionProblem extends StatelessWidget {
  const ConnectionProblem({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Silahkan Hubungkan Aplikasi Ke Internet"),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await InternetAddress.lookup('example.com');
                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                    print('Connected');
                    Fluttertoast.showToast(
                      msg: "Connected",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  }
                } on SocketException catch (_) {
                  print('not connected');
                  Fluttertoast.showToast(
                    msg: "Hubungkan Ke Internet",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              },
              child: Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }
}
