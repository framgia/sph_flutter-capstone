import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: appBarTheme,
        fontFamily: 'Inter',
      ),
      home: const Text('Flutter Demo Home Page'),
    );
  }
}
