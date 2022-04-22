import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final Widget content;
  final double width;

  const ElevatedCard({
    Key? key,
    required this.content,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(top: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(20.0) //                 <--- border radius here
            ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEDEDED),
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: content,
      ),
    );
  }
}
