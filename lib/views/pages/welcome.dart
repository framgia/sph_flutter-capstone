import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';

// For widgets to use the state they must extend HookConsumerWidget
class WelcomePage extends HookConsumerWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Must add WidgetRef
    final user = ref
        .watch(sessionProvider); // Allows access to the state without modifying

    List<Widget> widgetList = [
      ElevatedButton(
          onPressed: () => {navigateTo(context, '/login')},
          child: const Text('Login')),
      ElevatedButton(
          onPressed: () => {navigateTo(context, '/register')},
          child: const Text('Register')),
      Text(user.username), // access the state
    ];

    if (user.username != 'None') {
      widgetList.add(
        ElevatedButton(
          onPressed: () => {logout(ref)},
          child: const Text('Logout'),
        ),
      );
    }
    return Center(
      child: Column(
        children: widgetList,
      ),
    );
  }
}
