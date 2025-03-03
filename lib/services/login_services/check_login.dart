import 'package:eshare/helper/prefs_helper.dart';
import 'package:eshare/screens/home/home_screen.dart';
import 'package:eshare/screens/startpage/start_page.dart';
import 'package:flutter/material.dart';

Widget checkLogin() {
  var username = PrefsHelper().getPreference("username");

  if (username.toString().isNotEmpty) {
    return HomeScreen();
  } else {
    return StartPage();
  }
}
