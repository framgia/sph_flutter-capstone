import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class OutlinedRoseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const OutlinedRoseButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
      style: OutlinedButton.styleFrom(
        primary: AppColor.rose,
        side: const BorderSide(color: AppColor.rose)
      ),
    );
  }
}
