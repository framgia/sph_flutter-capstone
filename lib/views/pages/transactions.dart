import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/state/spending_provider.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class TransactionsPage extends HookConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spendingAmount = ref.watch(spendingProvider);
    return const Template(
      appbarTitle: Text('Transactions Page'),
      content: Center(child: Text('sample content')),
    );
  }
}
