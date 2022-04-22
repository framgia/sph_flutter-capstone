import 'package:flutter/material.dart';

class InputGroup extends StatelessWidget {
  final String label;
  final Widget input;

  const InputGroup({Key? key, this.label = '', required this.input})
      : super(key: key);

  addLabel() {
    if (label.isNotEmpty) {
      return Text(label);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addLabel(),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: input,
        ),
      ],
    );
  }
}
