import 'package:flutter/material.dart';

enum CategoryList {
  food,
  transportation,
  apparel,
  health,
  social,
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
