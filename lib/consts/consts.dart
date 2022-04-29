import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum CategoryList {
  food,
  transportation,
  apparel,
  health,
  social,
}

IconData getIcons(CategoryList cat) {
  switch (cat) {
    case CategoryList.food:
      return MdiIcons.foodOutline;
    case CategoryList.transportation:
      return Icons.drive_eta_outlined;
    case CategoryList.apparel:
      return MdiIcons.hanger;
    case CategoryList.health:
      return MdiIcons.handHeart;
    case CategoryList.social:
      return Icons.message_outlined;
    default:
      return Icons.attach_money_outlined;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
