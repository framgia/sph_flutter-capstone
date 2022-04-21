import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class CenterActionButton extends StatelessWidget {
  const CenterActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: AppColor.secondary,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
