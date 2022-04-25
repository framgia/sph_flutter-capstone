import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class SelectedInput extends StatefulWidget {
  final List<String> items;
  final String initialValue;

  const SelectedInput({
    Key? key,
    required this.items,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<SelectedInput> createState() => _SelectedInputState();
}

class _SelectedInputState extends State<SelectedInput> {
  String value = 'Item 1';
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField<String>(
        focusColor: AppColor.primary,
        value: value,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: widget.items.map(
          (String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(),
              ),
            );
          },
        ).toList(),
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map<Widget>((item) {
            return MouseRegion(
              onEnter: (isHovered) {
                setState(() {
                  isHovered = true as PointerEnterEvent;
                });
              },
              child: Text(
                item,
                style: TextStyle(
                    color: isHovered ? AppColor.lightGray : AppColor.gray),
              ),
            );
          }).toList();
        },
        onChanged: (String? newValue) {
          setState(() {
            value = newValue!;
          });
        },
      ),
    );
  }
}
