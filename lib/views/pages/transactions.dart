import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/rounded_background.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_layout.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class TransactionsPage extends HookConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Template(
      appbarTitle: Text('Transactions Page'),
      content: RoundedBackground(
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
            Summary(
              value: '₱ 1,840.00',
            ),
            Summary(
              label: 'Total Income',
              value: '₱ 1,840.00',
              labelColor: AppColor.secondary,
            ),
            Summary(
              label: 'Total Expense',
              value: '₱ 1,840.00',
              labelColor: AppColor.pink,
            ),
          ],
        ),
      ),
    );
  }
}

class Summary extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final List<Map<String, dynamic>> transactionList = [
    {
      'name': 'Profit',
      'amount': 850,
      'date': DateTime.now(),
      'type': 'Income',
    },
    {
      'name': 'Bills',
      'amount': 1500,
      'date': DateTime.now(),
      'type': 'Expense',
    },
  ];

  Summary({
    Key? key,
    this.label = 'Total',
    required this.value,
    this.labelColor = AppColor.darkBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // transaction summary 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                color: AppColor.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: labelColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
        //TODO: COMMON CONTENT HERE
        Container(
          margin: EdgeInsets.only(
            top: 25,
          ),
          child: Text('content here'),
        ),
      ],
    );
  }
}
