// import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:momentum_admin_panel/model/Api_model/login_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:momentum_admin_panel/model/Api_model/login_model.dart';

class AddImage {
  static Future<void> connectToApi({String id, File imgProduct}) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "http://www.momentumlifestyle.me:3015/product/media/upload",
      ),
    );
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'token':userLogin.token
    };
    request.headers['token'] = userLogin.token;
    request.headers["Content-Type"] = 'multipart/form-data';

    request.fields['token'] = userLogin.token;
    request.fields["key"] = "2f7fe98eaf8f800c267582fd53b6584f";
    request.fields["product_id"] = id;

    if (imgProduct != null) {
      print(imgProduct.path.split(".").last);
      request.files.add(
        http.MultipartFile.fromBytes(
          "file",
          imgProduct.readAsBytesSync(),
          filename: "test.${imgProduct.path.split(".").last}",
          contentType: MediaType("image", "${imgProduct.path.split(".").last}"),
        ),
      );
    }

    await request.send().then((onValue) {
      print(onValue.statusCode);
      // print(onValue.);
      print(onValue.stream.bytesToString());
      // print(onValue.headers);
      print(onValue.contentLength);
    });
  }
}
