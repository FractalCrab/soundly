import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:soundly/misc.dart';

Future<dynamic> loginAPI(String username, String pass) async {
  try {
    String url = baseAPIURL+"login";
    
    Response response =await get(url,headers: {"username":"test","password":"pass"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map responseBody = jsonDecode(response.body);
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
