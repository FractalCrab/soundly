import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:soundly/misc.dart';

Future<bool> loginAPI(String username, String pass) async {
  try {
    String url = baseAPIURL + "login";

    Response response =
        await post(url, body: {"username": username, "password": pass});
    Fluttertoast.showToast(
        msg: response.body,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        fontSize: 16.0);
    if (response.statusCode == 200) {
      return true;
    }

    //toast invalid credentials
    return false;
  } catch (e) {
    return false;
  }
}
