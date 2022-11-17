import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'excaption_app.dart';

class ApiServices {
  static final Map<String, String> _headers = {
    "Content-Type": "application/json"
  };
  //get
  static Future getApi({required String url}) async {
    dynamic res;
    //http get

    try {
      await http
          .get(
            Uri.parse(url),
            headers: _headers,
          )
          .then(
            (response) => res = _checkResponceCode(response),
          );
    } on SocketException {
      throw FetchDataExcaption();
    } on TimeoutException {
      throw AppExcaption(errorMessage: "Request TimeOut");
    } on Exception catch (e) {
      throw BadRequestExcaption();
    }
    // print(res.runtimeType);
    return res;
  }

  //post
  static Future postApi(
      {required String url, required Map<String, dynamic> mapData}) async {
    dynamic res;
    try {
      // http Post
      await http
          .post(
            Uri.parse(url),
            headers: _headers,
            body: jsonEncode(mapData),
          )
          .then(
            (response) => res = _checkResponceCode(response),
          );
    } on SocketException {
      throw FetchDataExcaption();
    } on TimeoutException {
      throw AppExcaption(errorMessage: "Request TimeOut");
    } on Exception catch (e) {
      throw BadRequestExcaption();
    }

    return res;
  }

  //delete

  //Api for Http request

  //CheckResponceCode
  static _checkResponceCode(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      default:
        throw AppExcaption(errorMessage: "Error ${response.body}");
    }
  }
}

// class InternetConnection {

// }
