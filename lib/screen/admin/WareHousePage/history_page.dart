import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<String> time = [
    "10 Januari 2020 , 10:00",
    "10 Januari 2020 , 11:00",
    "10 Januari 2020 , 12:00",
    "10 Januari 2020 , 13:00",
  ];
  final List<String> user = [
    "admin 1",
    "admin 3",
    "admin 2",
    "admin 2",
  ];
  final List<int> itemAdd = [
    40,
    20,
    10,
    100,
  ];
  final List<String> name = [
    'Scarlett Whitening Body Scrub Romansa Asd',
    'Scarlett Whitening Body Scrub Romansa Qwe',
    'Scarlett Whitening Body Scrub Romansa Zxcasd',
    'Scarlett Whitening Body Scrub Romansa aja yah',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cBlack,
          centerTitle: true,
          title: Text(
            "Riwayat Perubahan Stock",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xffEFEFEF),
                  ),
                )),
                padding: EdgeInsets.only(
                  left: 15,
                  top: 8,
                  bottom: 8,
                ),
                height: 80,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffDBEEFF),
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(
                        Momentumicon.approval,
                        color: Color(0xff198AF2),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: user[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff198AF2),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Menambahkan ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff696969),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${itemAdd[index].toString()} pcs",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff198AF2),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              name[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              time[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff696969),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
