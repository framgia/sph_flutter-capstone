import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class SamplePageWithAppBar extends StatelessWidget {
  const SamplePageWithAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      appbarTitle: Text('Sample title here'),
      content: Container(
        alignment: Alignment.center,
        child: Text('sample content here'),
      )
    );
  }
}