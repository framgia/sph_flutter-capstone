import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool isNumber;
  final String errorMessage;
  final TextEditingController inputController;

  const InputField({
    Key? key,
    this.isNumber = false,
    this.hintText = '',
    this.errorMessage = 'This field is required.',
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }
}
