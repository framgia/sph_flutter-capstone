import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class ExtraLogo extends StatelessWidget {
  const ExtraLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'ex',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: AppColor.secondary,
          ),
        ),
        Text(
          'tra',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w400,
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }
}
