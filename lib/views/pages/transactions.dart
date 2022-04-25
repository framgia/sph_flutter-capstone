import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_layout.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class TransactionsPage extends HookConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Template(
      appbarTitle: Text('Transactions Page'),
      content: Center(
        child: TabLayout(
          firstTab: Container(
            color: AppColor.pink,
            alignment: Alignment.center,
            child: Text('Expense content'),
          ),
          secondTab: Container(
            color: AppColor.light,
            alignment: Alignment.center,
            child: Text('Income content'),
          ),
        ),
      ),
    );
  }
}
