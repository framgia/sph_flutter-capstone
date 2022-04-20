import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/pages/home.dart';
import 'package:sun_flutter_capstone/views/pages/sample_with_appbar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: appBarTheme,
        fontFamily: 'Inter',
      ),
      home: SamplePageWithAppBar(),
    );
  }
}
