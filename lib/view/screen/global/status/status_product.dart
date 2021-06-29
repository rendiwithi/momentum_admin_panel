import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/model/status_model.dart';

class StatusProduct extends StatefulWidget {
  @override
  _StatusProductState createState() => _StatusProductState();
}

class _StatusProductState extends State<StatusProduct> {
  Color color1, color2, color3;
  String data;
  int _selectedIndex = 0;
  List<StatusModel> model;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        color1 = Color(0xffE8B730);
        color2 = Colors.white;
        color3 = Colors.white;
        data = "asd";
        model = paidItem;
      } else if (_selectedIndex == 1) {
        color2 = Color(0xffE8B730);
        color1 = Colors.white;
        color3 = Colors.white;
        data = "azxc";
        model = waitingItem;
      } else if (_selectedIndex == 2) {
        color3 = Color(0xffE8B730);
        color2 = Colors.white;
        color1 = Colors.white;
        data = "qwe";
        model = expiredItem;
      }
      // (_selectedIndex == 0)
      //     ? colorL = Color(0xffE8B730)
      //     : colorL = Colors.white;
      // (_selectedIndex == 1)
      //     ? colorR = Color(0xffE8B730)
      //     : colorR = Colors.white;
    });
  }

  @override
  void initState() {
    super.initState();
    _onItemTapped(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Status Pesanan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: cBlack,
          ),
          body: Column(
            children: [
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onItemTapped(0);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: color1,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          right: 30,
                          left: 30,
                        ),
                        child: Center(
                            child: Text(
                          "Paid",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: (color1 == Colors.white)
                                ? Colors.black
                                : color1,
                          ),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onItemTapped(1);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: color2,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          right: 30,
                          left: 30,
                        ),
                        child: Center(
                          child: Text(
                            "Waiting for Payment",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: (color2 == Colors.white)
                                  ? Colors.black
                                  : color2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onItemTapped(2);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: color3,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          right: 30,
                          left: 30,
                        ),
                        child: Center(
                          child: Text(
                            "Expired",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: (color3 == Colors.white)
                                  ? Colors.black
                                  : color3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model[index].code,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffE8B730),
                                  ),
                                ),
                                Text(
                                  model[index].time,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff696969),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top: 2),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Pesanan",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model[index].item.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          model[index].item[i].name,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff696969),
                                          ),
                                        ),
                                        Text(
                                          model[index].item[i].total,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff696969),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
