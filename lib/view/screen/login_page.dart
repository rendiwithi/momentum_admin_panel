import 'package:flutter/material.dart';
import 'package:momentum_admin_panel/constant/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momentum_admin_panel/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  UserModel model;
  bool isLogin = false;

  void loginUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    for (var i = 0; i < userData.length; i++) {
      if (userController.text == userData[i].username &&
          passwordController.text == userData[i].password) {
        model = userData[i];
        pref.setString("userName", model.username);
        pref.setString("userPassword", model.password);
        i = userData.length;
      } else {
        pref.setString("userName", "");
        pref.setString("userPassword", "");
      }
    }

    if (pref.getString("userName") == "" ||
        pref.getString("userPassword") == "") {
      Fluttertoast.showToast(
        msg: "Username Atau Password Salah",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      if (model.type == "admin") {
        pref.setString('route', '/admin/home');
        pref.setBool('isLogin', true);
        Navigator.pushReplacementNamed(context, '/admin/home');
      } else if (model.type == "sysadmin") {
        pref.setString('route', '/sysadmin/home');
        pref.setBool('isLogin', true);
        Navigator.pushReplacementNamed(context, '/sysadmin/home');
      }
    }
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBlack,
      body: (isLogin)
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: cBlack,
            )
          : Stack(
              children: [
                Positioned(
                  bottom: -25,
                  right: -25,
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/logo/decoration.png',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -20,
                    right: 100,
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/logo/decoration.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      Container(
                        height: 150,
                        color: cBlack,
                        child: Center(
                          child: Image.asset(
                            'assets/logo/logo.png',
                            width: 200,
                            height: 50,
                          ),
                        ),
                      ),
                      Text(
                        "Silahkan Masukkan Username Dan Password Untuk Masuk Ke Aplikasi",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 6, top: 28),
                        decoration: BoxDecoration(
                          color: Color(0xff1D1D1D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          style: TextStyle(color: Color(0xff777777)),
                          controller: userController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Username atau email anda",
                            hintStyle: TextStyle(color: Color(0xff777777)),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Color(0xff777777),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6, bottom: 16),
                        decoration: BoxDecoration(
                          color: Color(0xff1D1D1D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          style: TextStyle(color: Color(0xff777777)),
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Color(0xff777777)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xff777777),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Lupa Password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          loginUser();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 28),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              colors: [
                                Color(0xffD1B749),
                                Color(0xffDFC585),
                                Color(0xffBE9E50),
                              ],
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "Masuk sekarang",
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
