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
        content: TabLayout(
          tabButtonLabels: const [
            'All',
            'Incomes',
            'Expenses',
          ],
          tabColors: const [
            AppColor.darkBlue,
            AppColor.secondary,
            AppColor.pink,
          ],
          tabContents: [
            Container(
              color: AppColor.darkBlue,
              child: Center(
                child: Text(
                  'All content',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             Container(
              color: AppColor.secondary,
              child: Center(
                child: Text(
                  'All incomes content',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             Container(
              color: AppColor.pink,
              child: Center(
                child: Text(
                  'All Expenses content',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
