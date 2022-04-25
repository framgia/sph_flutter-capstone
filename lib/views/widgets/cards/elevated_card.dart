import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final Widget content;
  final bool isBoxShadowExist;
  final double width;
  final double margin;
  final Color boxColor;
  final EdgeInsetsGeometry padding;

  const ElevatedCard({
    Key? key,
    this.margin = 25.0,
    this.boxColor = Colors.white,
    this.isBoxShadowExist = true,
    required this.content,
    required this.width,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(top: margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(20.0) //                 <--- border radius here
            ),
        color: boxColor,
        boxShadow: isBoxShadowExist
            ? const [
                BoxShadow(
                  color: Color(0xFFEDEDED),
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ]
            : [],
      ),
      child: Container(
        padding: padding,
        child: content,
      ),
    );
  }
}
