import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class AccountSettingsPage extends HookConsumerWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Template(
      appbarTitle: Text('Account Settings Page'),
      content: Center(
        child: Text('Sample Content'),
      ),
    );
  }
}
