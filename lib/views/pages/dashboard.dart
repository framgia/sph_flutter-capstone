import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider);
    return Template(
      appbarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Good morning,',
            style: TextStyle(color: AppColor.gray, fontSize: 14),
          ),
          Text(user.username),
        ],
      ),
      isTitleCenter: false,
      content: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButtonText(
              text: 'Go To Notifications Page',
              onPressed: () => {navigateTo(context, Routes.notifications)},
            ),
            OutlinedButtonText(
              text: 'Outlined Pink',
              color: AppColor.pink,
              onPressed: () => {},
            ),
            OutlinedButtonText(
              text: 'Outlined Blue',
              onPressed: () => {},
            ),
            Visibility(
              visible: user.username != 'User',
              child: ElevatedButton(
                onPressed: () => logout(ref),
                child: const Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
