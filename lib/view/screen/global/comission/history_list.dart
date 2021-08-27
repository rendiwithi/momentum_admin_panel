import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({key}) : super(key: key);

  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      // padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/momentum-4f5a8.appspot.com/o/public%2Fuploads%2Fuser%2F3%2Fuser_m7utsa0zWRohKA%3D%3D.png?alt=media&token=55567d03-766d-4e09-ba5c-b583de4af80c"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rani Widyanti",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "BCA - 07861927861",
                                style: TextStyle(
                                  color: Color(0xff696969),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Container(
                          width: 140,
                          height: 40,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.done,
                                color: Color(0xff228DF0),
                              ),
                              Text(
                                "Sudah Transfer",
                                style: TextStyle(
                                  color: Color(0xff228DF0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Tanggal Penarikan",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "24 Agustus 2020 20:00",
                              style: TextStyle(
                                color: Color(0xff228DF0),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 50,
                      color: cGrey,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      margin: EdgeInsets.only(top: 1),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Jumlah Transfer",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Rp 50.000.000,-",
                              style: TextStyle(
                                color: Color(0xffE8B730),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
