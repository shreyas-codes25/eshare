import 'package:eshare/helper/prefs_helper.dart';
import 'package:eshare/providers/api_provider.dart';
import 'package:eshare/providers/auth/auth_api_endpoints.dart';
import 'package:eshare/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<Map<String, dynamic>> authenticate(
    String username, String password) async {
  Map<String, dynamic> body = {
    "username": username,
    "password": password,
    "scope": "master",
    "token": "true",
    "ip": "104.148.209.0",
    "protocol": "web",
    "sess": "postman"
  };
  var response = await ApiProvider.post(
      endPoint: AuthApiEndpoints.login,
      headers: {
        "Content-Type": "application/json",
      },
      body: body);

  return response;
}

Future<void> authCheck(
    Map<String, dynamic> response, BuildContext context) async {
  if (response.containsKey("error")) {
    Fluttertoast.showToast(
        msg: response['error'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  } else if (response['success'] == true) {
    PrefsHelper.saveToPrefs("token", response["token"]);
    PrefsHelper.saveToPrefs("username", response["username"]);
    PrefsHelper.saveToPrefs("id", response["id"]);
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        msg: "Welcome User",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.lightBlue,
        textColor: Colors.black,
        fontSize: 16);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
