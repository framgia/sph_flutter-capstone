import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/views/widgets/rounded_background.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_layout.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/transaction_card.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionProvider);

    renderTransactions(dataList) {
      var transactionWidgets = <Widget>[];

      for (var data in dataList) {
        final IconData icon = data['type'] == 'income' ? Icons.attach_money_outlined : getIcons(CategoryList.values[data['category_id']]);

        transactionWidgets.add(Container(
          margin: EdgeInsets.only(bottom: 16),
          child: TransactionCard(
            icon: Icon(icon, color: Colors.black.withOpacity(0.5)),
            type: data['type'],
            currency: 'PHP',
            amount: data['amount'], // TODO: Integrate currency _trans.amount
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
              value: '₱ 1,840.00',
              dataList: transactionsAsync.when(
                data: (data) => renderTransactions(data),
                loading: () => <Widget>[],
                error: (e, st) => <Widget>[],
              ),
            ),
            TabContent(
              label: 'Total Income',
              value: '₱ 1,840.00',
              labelColor: AppColor.secondary,
              dataList: <Widget>[],
            ),
            TabContent(
              label: 'Total Expense',
              value: '₱ 1,840.00',
              labelColor: AppColor.pink,
              dataList: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final List<Widget> dataList;

  const TabContent({
    Key? key,
    required this.value,
    required this.dataList,
    this.label = 'Total',
    this.labelColor = AppColor.darkBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // transaction TabContent
        Total(
          label: label,
          value: value,
          labelColor: labelColor,
        ),
        //TODO: COMMON CONTENT HERE
        Container(
          margin: EdgeInsets.only(
            top: 25,
          ),
          child: Column(children: dataList),
        ),
      ],
    );
  }
}

class Total extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;

  const Total({
    Key? key,
    required this.label,
    required this.value,
    required this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
