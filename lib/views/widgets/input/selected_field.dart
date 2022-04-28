import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class SelectInput extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final Function(String) valueReceiver;
  final String errorMessage;

  const SelectInput({
    Key? key,
    required this.items,
    required this.initialValue,
    required this.valueReceiver,
    this.errorMessage = 'This field is required.',
  }) : super(key: key);

  @override
  State<SelectInput> createState() => _SelectedInputState();
}

class _SelectedInputState extends State<SelectInput> {
  bool onSelect = false;
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: widget.items.map(
              (String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ).toList(),
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map<Widget>((item) {
            return Text(
              item,
              style: TextStyle(
                color: onSelect ? AppColor.secondary : AppColor.gray,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            );
          }).toList();
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return widget.errorMessage;
          }
          return null;
        },
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            onSelect = true;
            widget.valueReceiver(widget.items.indexOf(newValue).toString());
          });
        },
      ),
    );
  }
}