import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

// TODO: change widget to accept onPressed event
class NavigationButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const NavigationButton({
    Key? key,
    required this.icon,
    this.iconColor = AppColor.lightGray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: iconColor, size: 40),
      padding: EdgeInsets.zero,
      onPressed: () {},
      splashRadius: 1,
    );
  }
}
