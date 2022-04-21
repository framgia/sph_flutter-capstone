import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

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
            ElevatedButton(
              onPressed: () => goToHome(context),
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () => setSessionUsername(ref, 'Hello'),
              child: const Text('Login As Hello'),
            )
          ],
        ));
  }
}
