import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class OutlinedButtonText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const OutlinedButtonText({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = AppColor.secondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        primary: color,
        side: BorderSide(color: color, width: 2)
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
