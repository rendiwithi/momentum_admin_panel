import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/icon/momentumicon_icons.dart';
import 'package:momentum_admin_panel/model/reseller_model.dart';
import 'package:momentum_admin_panel/screen/global/resellerData/resellerDetail/reseller_detail_page.dart';

class ResselerDataScreen extends StatefulWidget {
  @override
  _ResselerDataScreenState createState() => _ResselerDataScreenState();
}

class _ResselerDataScreenState extends State<ResselerDataScreen> {
  final TextEditingController searchController = new TextEditingController();
  List<ResellerModel> model = resellerMomentumModel;
  Widget _createResselerData(ResellerModel data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResellerDetailPage(data: data,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              data.imgUrl,
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              data.email,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff696969),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: PopupMenuButton(
                      child: Icon(Icons.more_horiz),
                      onSelected: (value) {
                        print("value:$value");
                        actionPopUpItemSelected(value);
                      },
                      itemBuilder: (context) {
                        return <PopupMenuEntry>[
                          PopupMenuItem(
                            height: 35,
                            value: 'change',
                            child: Text('Ubah'),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            height: 35,
                            value: 'delete',
                            child: Text('Hapus'),
                          )
                        ];
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              margin: EdgeInsets.only(top: 1),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Penjualan",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Rp. ${(data.profit)},-",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffE8B730),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.verified_user,
                          color: (data.isValidate)
                              ? Color(0xff228DF0)
                              : Color(0xff7D8487),
                          size: 16,
                        ),
                        Text(
                          (data.isValidate)
                              ? "Menunggu Divalidasi"
                              : "Diterbitkan",
                          style: TextStyle(
                            color: (data.isValidate)
                                ? Color(0xff228DF0)
                                : Color(0xff7D8487),
                            fontSize: 10,
                          ),
                        ),
                      ],
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: cBlack,
          title: Text("Data Reseller"),
        ),
        body: ListView.builder(
          itemCount: 1 + model.length,
          itemBuilder: (BuildContext context, int index) {
            return (index == 0)
                ? Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 15,
                      right: 15,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: cGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Momentumicon.search,
                            color: Color(0xff696969),
                            size: 18,
                          ),
                          hintText: "Cari reseller",
                          hintStyle: TextStyle(
                            color: Color(0xff696969),
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                : _createResselerData(model[index - 1]);
          },
        ),
      ),
    );
  }
}

void actionPopUpItemSelected(String value) {
  String message;
  if (value == 'change') {
    message = 'You change';
  } else if (value == 'delete') {
    message = 'You delete';
  } else {
    message = 'Not implemented';
  }
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    // timeInSecForIos: 1,
  );
}
