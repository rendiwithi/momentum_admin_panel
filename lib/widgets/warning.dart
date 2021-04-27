import 'package:flutter/material.dart';

class ErrorWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffFFDBC7),
        border: Border(
          top: BorderSide(width: 2, color: Color(0xffF06C22)),
          bottom: BorderSide(width: 2, color: Color(0xffF06C22)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 32,
              color: Color(0xffF06C22),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stok barang akan segera habis",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffF06C22),
                    ),
                  ),
                  Text(
                    "Segera lakukan pembelian agar tidak kehabisan",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff696969),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
