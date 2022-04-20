import 'package:flutter/material.dart';

class OutlinedBlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const OutlinedBlueButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
