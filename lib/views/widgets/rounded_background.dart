import 'package:flutter/material.dart';

class RoundedBackground extends StatelessWidget {
  final Widget content;

  const RoundedBackground({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: content,
    );
  }
}
