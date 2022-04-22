import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/date_field.dart';

class SamplePageWithAppBar extends HookConsumerWidget {
  const SamplePageWithAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Template(
        appbarTitle: const Text('Sample title here'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('sample content here')),
            FilledButtonText(
              text: 'Home',
              onPressed: () => goToHome(context),
            ),
            FilledButtonText(
              text: 'Login As Hello',
              onPressed: () => setSessionUsername(ref, 'Hello'),
            ),
            DateField(
              firstDate: DateTime(DateTime.now().year, 1),
              lastDate: DateTime.now(),
            ),
            OutlinedButtonText(
              text: 'Outlined Blue',
              onPressed: () {},
            ),
            OutlinedButtonText(
              text: "Outlined Pink",
              color: AppColor.pink,
              onPressed: () {},
            )
          ],
        ));
  }
}
