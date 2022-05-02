import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionSummary extends StatefulHookConsumerWidget {
  final String currency;

  const TransactionSummary({
    Key? key,
    required this.currency,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionSummary();
}

class _TransactionSummary extends ConsumerState<TransactionSummary> {

  @override
  Widget build(BuildContext context) {
    final amountFormat = AmountFormat();
    final transactionState = ref.watch(transactionsNotifierProvider);
    final expensesState = ref.watch(expenseTransactionsProvider);
    final incomesState = ref.watch(incomeTransactionsProvider);

    getData(data, section){
      double _totalExpense = 0;
      double _totalIncome = 0;

      for (var transation in data) {
        if (transation['type'] == 'expense') {
          _totalExpense += transation['amount'];
        } else {
          _totalIncome += transation['amount'];
        }
      }

      if (section == 'expense') {
        return amountFormat.amount(_totalExpense, widget.currency);
      } else if (section == 'income') {
        return amountFormat.amount(_totalIncome, widget.currency);
      } else {
        return amountFormat.amount(
            _totalIncome - _totalExpense, widget.currency);
      }
    }

    renderTransactions(data, section) {
      var transactionWidgets = <Widget>[];

      if(section == 'all') {
        transactionWidgets.add(
          Text(
            getData(data, section),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        );
      }
      else {
        transactionWidgets.add(
          Text(
            getData(data, section),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.8,
              color: Colors.white,
            ),
          ),
        );
      }

      return transactionWidgets;
    }

    return ElevatedCard(
      width: 374.0,
      boxColor: AppColor.darkBlue,
      margin: 33.0,
      content: Container(
        height: 156.0,
        padding: const EdgeInsets.symmetric(
          vertical: 17.12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            transactionState.when(
              data: (data) =>
                  Column(children: renderTransactions(data, 'all')),
              error: (e, st) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.15), // Button color
                            child: InkWell(
                              // Splash color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Income',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.lightGray,
                          ),
                        ),
                      ],
                    ),
                    incomesState.when(
                      data: (data) =>
                          Column(children: renderTransactions(data, 'income')),
                      error: (e, st) => Text(e.toString()),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.15), // Button color
                            child: InkWell(
                              // Splash color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    Icons.arrow_upward_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Expenses',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.lightGray,
                          ),
                        ),
                      ],
                    ),
                    expensesState.when(
                      data: (data) =>
                          Column(children: renderTransactions(data, 'expense')),
                      error: (e, st) => Text(e.toString()),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
