import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final String errorMessage;
  final TextInputType inputType;
  final TextEditingController inputController;
  final bool isEmail;

  const InputField({
    Key? key,
    this.hintText = '',
    this.errorMessage = 'This field is required.',
    this.inputType = TextInputType.text,
    this.isEmail = false,
    required this.inputController,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      onFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(onFocus);
    _focusNode.dispose();
  }

  onFocus() {
    setState(() {
      isFocused = !isFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      validator: (value) {
        if (widget.isEmail) {
          final bool isValid = EmailValidator.validate(value!);
          if (!isValid) return 'Invalid email';
        } else if (value == null || value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      focusNode: _focusNode,
      style: TextStyle(
        color: isFocused ? AppColor.secondary : AppColor.gray,
      ),
      keyboardType: widget.inputType,
    );
  }
}
