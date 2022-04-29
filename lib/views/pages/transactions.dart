import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/views/widgets/rounded_background.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_layout.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/transaction_card.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionState = ref.watch(transactionsNotifierProvider);
    final expensesState = ref.watch(expenseTransactionsProvider);
    final incomesState = ref.watch(incomeTransactionsProvider);

    renderTransactions(dataList) {
      var transactionWidgets = <Widget>[];

      for (var data in dataList) {
        final IconData icon = data['type'] == 'income'
            ? Icons.attach_money_outlined
            : getIcons(CategoryList.values[data['category_id'] - 1]);

        transactionWidgets.add(Container(
          margin: EdgeInsets.only(bottom: 16),
          child: TransactionCard(
            icon: Icon(icon, color: Colors.black.withOpacity(0.5)),
            type: data['type'],
            currency: 'PHP',
            amount: data['amount'], // TODO: Integrate currency
            description: data['description'],
            dateTime: data['date'],
          ),
        ));
      }
      return transactionWidgets;
    }

    // WidgetRef ref
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
            TabContent(
              value: 1840.0,
              content: transactionState.when(
                data: (data) => Column(children: renderTransactions(data)),
                error: (e, st) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
            TabContent(
              label: 'Total Income',
              value: 1840.0,
              labelColor: AppColor.secondary,
              content: incomesState.when(
                data: (data) => Column(children: renderTransactions(data)),
                error: (e, st) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
            TabContent(
              label: 'Total Expense',
              value: 3840.0,
              labelColor: AppColor.pink,
              content: expensesState.when(
                data: (data) => Column(children: renderTransactions(data)),
                error: (e, st) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String label;
  final double value;
  final Color labelColor;
  final Widget content;

  const TabContent({
    Key? key,
    required this.value,
    required this.content,
    this.label = 'Total',
    this.labelColor = AppColor.darkBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // transaction TabContent
          Total(
            label: label,
            value: value,
            labelColor: labelColor,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 25,
            ),
            child: content,
          ),
        ],
      ),
    );
  }
}

class Total extends ConsumerWidget {
  final String label;
  final double value;
  final Color labelColor;

  const Total({
    Key? key,
    required this.label,
    required this.value,
    required this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedInUser = ref.watch(accountProvider);
    final amountFormat = AmountFormat();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          amountFormat.amount(value, signedInUser?.currency ?? 'PHP'),
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
    );
  }
}
