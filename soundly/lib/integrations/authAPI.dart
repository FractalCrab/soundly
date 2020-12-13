import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:soundly/misc.dart';

Future<dynamic> loginAPI(String username, String pass) async {
  try {
    String url = baseAPIURL + "login";

    Response response =
        await post(url, body: {"username": username, "password": pass});
    print(response.body);
    if (response.statusCode == 200) {
      String responseBodyStr = response.body;
      Map<String, dynamic> responseBody = jsonDecode(responseBodyStr);
      print(responseBody);
      if (responseBody["success"]) {
        return true;
      } else {
        return false;
        // toast responseBody["error"]
      }
    } else {
      //toast invalid response
      return false;
    }
  } catch (e) {
    return false;
  }
}
