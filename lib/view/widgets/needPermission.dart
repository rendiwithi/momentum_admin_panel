import 'package:flutter/material.dart';

Future<void> needPermission(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: const Text('Hak Akses Diperlukan')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Center(
                child: Text('Tidak bisa membuka halaman ini !!!'),
              ),
              Center(
                child: Text('Harap hubungi Admin tertinggi'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Mengerti'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
