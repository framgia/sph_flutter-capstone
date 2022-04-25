import 'package:flutter/material.dart';

class AppColor {
  static const Color light = Color(0xFFDCE3F9);
  static const Color primary = Color(0xFF9BABE2);
  static const Color secondary = Color(0xFF324ED9);
  static const Color lightGray = Color(0xFFA7ABB8);
  static const Color gray = Color(0xFF666666);
  static const Color darkBlue = Color(0xFF242D58);
  static const Color onyx = Color(0xFF242D58);
  static const Color red = Color(0xFFD93232);
  static const Color pink = Color(0xFFFE91A7);
  static const Color rose = Color(0xFFAD707C);
}

// TODO: STYLE FOR HEADER TEXT
const headerStyle = TextStyle(
  fontFamily: 'Inter',
  color: AppColor.secondary,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

// TODO: THEME FOR APPBAR
const appBarTheme = AppBarTheme(
  actionsIconTheme: IconThemeData(color: AppColor.gray, size: 28),
  iconTheme: IconThemeData(color: AppColor.gray, size: 28),
  elevation: 0,
  centerTitle: true,
  backgroundColor: AppColor.light,
  titleTextStyle: headerStyle,
);

// TODO: THEME FOR ALL TEXT IN BODY
const textTheme = TextTheme(
  bodyText2: TextStyle(fontSize: 14, color: AppColor.gray),
);

// TODO: FOR ROUNDED INPUT FIELD
const rounded = BorderRadius.all(
  Radius.circular(8),
);

// TODO: THEME FOR ALL INPUT FIELDS
const inputDecorationTheme = InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.secondary),
    borderRadius: rounded,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.lightGray),
    borderRadius: rounded,
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: rounded,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.red),
    borderRadius: rounded,
  ),
);

// TODO: STYLE FOR BUTTON
OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    primary: AppColor.secondary,
    minimumSize: const Size.fromHeight(60.0),
    side: const BorderSide(color: AppColor.secondary, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: AppColor.secondary,
    shadowColor: Colors.transparent,
    elevation: 0,
    minimumSize: const Size.fromHeight(60.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);

class ProgressBarTheme {
  static const Color barColor = AppColor.pink;
  static const Color bgColor = Color(0xFFF0F6F5);
}
