import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';
import 'package:sun_flutter_capstone/controllers/income_controller.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/views/widgets/rounded_background.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_layout.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/transaction_card.dart';

class TransactionsPage extends StatefulHookConsumerWidget {
  const TransactionsPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransactionState();
}

class _TransactionState extends ConsumerState<TransactionsPage> {
  double totalIncome = 0;
  double totalExpense = 0;
  double totalBalance = 0;

  @override
  Widget build(BuildContext context) {
    final transactionState = ref.watch(transactionsNotifierProvider);
    final expensesState = ref.watch(expenseTransactionsProvider);
    final incomesState = ref.watch(incomeTransactionsProvider);

    renderTransactions(dataList, section) {
      var transactionWidgets = <Widget>[];
      double _totalIncome = 0;

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

        if (section == 'all') {
          if (data['type'] == 'income') {
            _totalIncome += data['amount'];
          } else {
            _totalIncome -= data['amount'];
          }
          print(_totalIncome);
        } else {
          _totalIncome += data['amount'];
        }
      }

      if (section == 'income') {
        setState(() {
          totalIncome = _totalIncome;
        });
      } else if (section == 'expense') {
        setState(() {
          totalExpense = _totalIncome;
        });
      } else if (section == 'all') {
        setState(() {
          totalBalance = _totalIncome;
        });
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
              value: totalBalance,
              content: transactionState.when(
                data: (data) =>
                    Column(children: renderTransactions(data, 'all')),
                error: (e, st) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
            TabContent(
              label: 'Total Income',
              value: totalIncome,
              labelColor: AppColor.secondary,
              content: incomesState.when(
                data: (data) =>
                    Column(children: renderTransactions(data, 'income')),
                error: (e, st) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
            TabContent(
              label: 'Total Expense',
              value: totalExpense,
              labelColor: AppColor.pink,
              content: expensesState.when(
                data: (data) =>
                    Column(children: renderTransactions(data, 'expense')),
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
