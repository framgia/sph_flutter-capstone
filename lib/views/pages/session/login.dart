import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          const Text('Login Route'),
          ElevatedButton(
            onPressed: () => {goToHome(context)},
            child: const Text('Back'),
          ),
          ElevatedButton(
            onPressed: () => {setSessionUsername(ref, 'User')},
            child: const Text('Login as User'),
          ),
        ],
      ),
    );
  }
}
