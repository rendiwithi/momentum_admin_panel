// import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:momentum_admin_panel/constant/data.dart';

class AddBannerImage {
  static Future<void> connectToApi({String id, File imgBanner}) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(
        "http://www.momentumlifestyle.me:3015/slide/update",
      ),
    );
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'token': tokenUser
    };
    request.headers['token'] = tokenUser;
    request.headers["Content-Type"] = 'multipart/form-data';

    request.fields['token'] = tokenUser;
    request.fields["key"] = "2f7fe98eaf8f800c267582fd53b6584f";
    request.fields["id"] = id;

    if (imgBanner != null) {
      print(imgBanner.path.split(".").last);
      request.files.add(
        http.MultipartFile.fromBytes(
          "slide_file",
          imgBanner.readAsBytesSync(),
          filename: "test.${imgBanner.path.split(".").last}",
          contentType: MediaType("image", "${imgBanner.path.split(".").last}"),
        ),
      );
    }

    await request.send().then((onValue) {
      print(onValue.statusCode);
      print(onValue.stream.bytesToString());
      print(onValue.contentLength);
    });
  }
}
