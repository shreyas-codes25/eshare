/*


*/

import 'package:eshare/auth/login/password.dart';
import 'package:flutter/material.dart';

void forwarding(String username, BuildContext context) {
  username = username.trim().replaceAll(' ', '');
  if (username.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Password(username: username),
      ),
    );
  } else {
    SnackBar snackBar = SnackBar(
      content: Text("Please Enter a valid Username"),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
