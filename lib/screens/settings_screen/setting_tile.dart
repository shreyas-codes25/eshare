import 'package:flutter/material.dart';

Widget settingTile(
    String title, IconData icon, String subtitle, Function onTap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    onTap: () {
      onTap();
    },
  );
}
