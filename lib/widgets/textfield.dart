import 'package:flutter/material.dart';

Widget customText({required String title, required double size}) {
  return Text(
    title,
    style: TextStyle(
        fontSize: size, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
  );
}
