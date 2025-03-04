import 'package:eshare/screens/startpage/start_page.dart';

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
            seedColor: const Color.fromARGB(255, 0, 102, 255)),
        useMaterial3: true,
      ),
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
