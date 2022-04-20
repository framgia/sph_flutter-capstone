// Sample File for Structure Demonstration
import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/pages/sample_with_appbar.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      appbarTitle: Container(
        // padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Good morning,',
              style: TextStyle(color: AppColor.gray, fontSize: 14),
            ),
            Text('User'),
          ],
        ),
      ),
      isTitleCenter: false,
      content: Text('This is a sample content'),
    );
  }
}
