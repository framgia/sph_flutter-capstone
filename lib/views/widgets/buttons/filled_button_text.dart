import 'package:flutter/material.dart';

class FilledButtonText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const FilledButtonText({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
