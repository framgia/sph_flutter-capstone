import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';

import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/state/spending_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/pages/transaction_summary.dart';
import 'package:sun_flutter_capstone/views/widgets/progress_bar.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/transaction_card.dart';
import 'package:sun_flutter_capstone/controllers/income_controller.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';

class Dashboard extends StatefulHookConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  final String firstName = 'Juan Dela';
  final String lastName = 'Dela Cruz';
  final String currency = 'fil';

  final List<Map<String, dynamic>> data = const [
    {
      'type': 'income',
      'description': 'Salary',
      'amount': 50000.0,
      'icon': Icons.attach_money_outlined,
      'date': '2022-04-25T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
    {
      'type': 'expenses',
      'description': 'Gas bill',
      'amount': 3000.0,
      'icon': Icons.drive_eta_outlined,
      'date': '2022-04-23T11:00:00.000Z',
    },
  ];

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
          : getIcons(CategoryList.values[transactionData['category_id']]);

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

  final IncomeController incomeHandler = IncomeController();
  final ExpenseController expenseHandler = ExpenseController();

  double totalIncome = 0.0;
  double totalExpense = 0.0;

  @override
  void initState() {
    super.initState();
    _totalValues();
  }

  Future<void> _totalValues() async {
    double incomes = await incomeHandler.totalIncome();
    double expenses = await expenseHandler.totalExpence();
    setState(() {
      totalIncome = incomes;
      totalExpense = expenses;
    });
  }

  @override
  Widget build(BuildContext context) {
    final signedInAccount = ref.watch(accountProvider);
    final spendingAmount = ref.watch(spendingProvider);

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
                  totalBalance: totalIncome - totalExpense,
                  totalIncome: totalIncome,
                  totalExpenses: totalExpense,
                  currency: signedInAccount?.currency ?? 'PHP',
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 10),
                  child: ProgressBar(
                    progress: spendingAmount,
                    label: "You have spent",
                  ),
                ),
                // * The following row can be removed this is just for testing the progress bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          setSpendingAmount(ref, spendingAmount - 0.1);
                        },
                        child: const Text('-'),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          setSpendingAmount(ref, spendingAmount + 0.1);
                        },
                        child: const Text('+'),
                      ),
                    )
                  ],
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
                        onPressed: () =>
                            redirectTo(context, Routes.transactions),
                        child: Text('See all'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder(
                    initialData: const [],
                    future: TransactionController().transactionList(10),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Column(
                            children: fetchTransactions(snapshot.data ?? []));
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
