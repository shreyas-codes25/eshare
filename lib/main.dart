import 'package:eshare/services/login_services/check_login.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 80, 158, 231),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: checkLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
