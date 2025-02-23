import 'package:flutter/material.dart';

Widget authButton(
  String title,
  Function onPressed,
  BuildContext context,
) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Container(
      height: 44.0,
      width: MediaQuery.of(context).size.width / 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 195, 213, 250), Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
