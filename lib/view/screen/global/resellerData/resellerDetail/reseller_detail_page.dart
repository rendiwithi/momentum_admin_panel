import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:momentum_admin_panel/assets/momentumicon_icons.dart';
import 'package:momentum_admin_panel/model/Reseller_model/reseller_model.dart';
import 'package:momentum_admin_panel/model/reseller_model.dart';

class ResellerDetailPage extends StatefulWidget {
  final Seller data;

  const ResellerDetailPage({key, this.data}) : super(key: key);

  @override
  _ResellerDetailPageState createState() => _ResellerDetailPageState();
}

class _ResellerDetailPageState extends State<ResellerDetailPage> {
  ResellerModel model = resellerMomentumModel[0];
  Widget _createProfile(String menu, String profile) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            menu,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff696969)),
          ),
          Text(
            profile,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
          ),
        ],
      ),
    );
  }

  Widget _createSocialMedia(String image, String sosmed) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(
              right: 15,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo/${(image)}.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(
            sosmed,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: cBlack,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  print("object aowkoawkoakw");
                                },
                                child: Icon(
                                  Momentumicon.arrow_left,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      (widget.data.imgUrl == "-")?model.imgUrl:widget.data.imgUrl,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      widget.data.name,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffE8B730),
                                      ),
                                    ),
                                    Text(
                                      widget.data.email,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffB3FFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                child: Column(
                                  children: [
                                    Text(
                                      "Produk Terjual",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffE8B730),
                                      ),
                                    ),
                                    Text(
                                      "${(widget.data.sale)} Produk",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 2,
                                color: Colors.white,
                              ),
                              Container(
                                height: 50,
                                child: Column(
                                  children: [
                                    Text(
                                      "Total Penjualan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffE8B730),
                                      ),
                                    ),
                                    Text(
                                      "Rp.${(widget.data.income)} ,-",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
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
                  ),
                  Positioned(
                    top: -10,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/logo/top_decoration.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/logo/bottom_decoration.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffFFB347),
                            Color(0xffFFCC33),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Voucher Potongan ${(widget.data.code)}%",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: (){
                              print("copy");
                            },
                            child: Row(
                              children: [
                                Text(
                                  widget.data.code,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Momentumicon.copy,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Pribadi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        _createProfile("Tanggal Dibuat", widget.data.created),
                        _createProfile("Nama Lengkap", widget.data.name),
                        _createProfile("Jenis Kelamin", widget.data.gender),
                        _createProfile("No Hp", widget.data.phone),
                        _createProfile("Email", widget.data.email),
                        _createProfile("No KTP", widget.data.identitiyNumber),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Rekening",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        _createProfile("Nama Bank", widget.data.bank),
                        _createProfile(
                            "Nomor Rekening", widget.data.bankNo),
                        _createProfile("Nama Pemilik", widget.data.bankUser),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Social Media",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        _createSocialMedia("instagram", widget.data.instagram),
                        _createSocialMedia("youtube", widget.data.youtube),
                        _createSocialMedia("tiktok", widget.data.tiktok),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
