import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final String errorMessage;
  final TextInputType inputType;
  final bool isPassword;
  final TextEditingController inputController;

  const InputField({
    Key? key,
    this.hintText = '',
    this.errorMessage = 'This field is required.',
    this.inputType = TextInputType.text,
    this.isPassword = false,
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
      keyboardType: inputType,
      obscureText: isPassword,
    );
  }
}
