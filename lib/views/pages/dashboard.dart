import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';

import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/controllers/spending_limit_controller.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/state/navigation_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/pages/transaction_summary.dart';
import 'package:sun_flutter_capstone/views/widgets/progress_bar.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/transaction_card.dart';
import 'package:sun_flutter_capstone/controllers/income_controller.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';

class Dashboard extends StatefulHookConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  final String firstName = 'Juan Dela';
  final String lastName = 'Dela Cruz';
  final String currency = 'fil';

  String _greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning,';
    } else if (hour < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  List<Widget> fetchTransactions(transData) {
    var transactionWidgets = <Widget>[];

    for (var transactionData in transData) {
      final IconData icon = transactionData['type'] == 'income'
          ? Icons.attach_money_outlined
          : getIcons(CategoryList.values[transactionData['category_id'] - 1]);

      transactionWidgets.add(Container(
        margin: EdgeInsets.only(bottom: 16),
        child: TransactionCard(
          icon: Icon(icon, color: Colors.black.withOpacity(0.5)),
          type: transactionData['type'],
          currency: 'PHP',
          amount: transactionData['amount'],
          description: transactionData['description'],
          dateTime: transactionData['date'],
        ),
      ));
    }

    return transactionWidgets;
  }

  final ExpenseController expenseHandler = ExpenseController();

  double totalExpense = 0.0;

  @override
  void initState() {
    super.initState();
    _totalValues();
  }

  Future<void> _totalValues() async {
    double expenses = await expenseHandler.totalExpence();
    setState(() {
      totalExpense = expenses;
    });
  }

  @override
  Widget build(BuildContext context) {
    final signedInAccount = ref.watch(accountProvider);
    final spendingLimit = ref.watch(spendingLimitProvider);
    final expensesState = ref.watch(expenseTransactionsProvider);

    double getLimit(data) {
      double _totalExpense = 0;

      for (var transation in data) {
        if (transation['type'] == 'expense') {
          _totalExpense += transation['amount'];
        }
      }

      double total = _totalExpense / spendingLimit;

      if (spendingLimit == 0) return 0;
      if (total > 1) return 1;

      return total;
    }

    return Template(
      automaticallyImplyLeading: false,
      appbarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget._greeting(),
            style: TextStyle(color: AppColor.gray, fontSize: 14),
          ),
          Text(
            signedInAccount?.name ?? 'Aubrey',
            style: TextStyle(color: AppColor.secondary, fontSize: 20),
          ),
        ],
      ),
      isTitleCenter: false,
      content: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TransactionSummary(
                  currency: signedInAccount?.currency ?? 'PHP',
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: (spendingLimit == 0) ? 0 : 35,
                      left: 20,
                      right: 20,
                      bottom: (spendingLimit == 0) ? 0 : 10),
                  child: (spendingLimit == 0)
                      ? Text('')
                      : expensesState.when(
                          data: (data) => ProgressBar(
                            progress: getLimit(data),
                            label: "You have spent",
                          ),
                          error: (e, st) => Text(e.toString()),
                          loading: () => const CircularProgressIndicator(),
                        ),
                ),
                // Recent transactions
                Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.black.withOpacity(0.5),
                            textStyle: TextStyle(fontSize: 14)),
                        onPressed: () {
                          redirectTo(context, Routes.transactions);
                          setCurrentPage(ref, Routes.transactions);
                        },
                        child: Text('See all'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder(
                    initialData: const [],
                    future: TransactionController().transactionList(10, 'all'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                          children: fetchTransactions(snapshot.data ?? []),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
