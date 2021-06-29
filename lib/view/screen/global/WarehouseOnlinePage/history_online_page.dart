import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/model/history_model.dart';

class HistoryOnlinePage extends StatefulWidget {
  @override
  _HistoryOnlinePageState createState() => _HistoryOnlinePageState();
}

class _HistoryOnlinePageState extends State<HistoryOnlinePage> {
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
        itemCount: historyOnline.length,
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
                                text: historyOnline[index].user,
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
                                text:
                                    "${historyOnline[index].stock.toString()} pcs",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff198AF2),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          historyOnline[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          historyOnline[index].name,
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
        },
      ),
    );
  }
}
