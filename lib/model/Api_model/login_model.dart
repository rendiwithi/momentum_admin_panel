import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginResult {
  String message;
  String username;
  String role;
  int code;

  LoginResult({this.message, this.code, this.username, this.role});

  factory LoginResult.fromJson(Map<String, dynamic> object) {
    return LoginResult(
      message: object["message"],
      code: object["code"],
      username: (object["code"] == 200) ? (object["data"])["username"] : "",
      role: (object["code"]==200 && (object["data"])["type"] == 5) ? "sysadmin" : "admin",
    );
  }

  static Future<LoginResult> connectToApi({
      String username, String password}) async {
    String apiUrl = "http://www.momentumlifestyle.me:3015/user/login";
    var apiresult = await http.post(Uri.parse(apiUrl), body: {
      "username": username,
      "password": password,
      "key": "2f7fe98eaf8f800c267582fd53b6584f"
    });

    var jsonObj = json.decode(apiresult.body);
    return LoginResult.fromJson(jsonObj);
  }
}