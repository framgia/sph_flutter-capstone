import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/state/spending_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/pages/transaction_summary.dart';
import 'package:sun_flutter_capstone/views/widgets/progress_bar.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/transaction_card.dart';


class Dashboard extends StatefulHookConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  final String firstName = 'Juan Dela';
  final String lastName = 'Dela Cruz';
  final String currency = 'fil';
  final double totalIncome = 50000;
  final double totalExpenses = 30000;

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
  get transactions  {
    var transactionWidgets = <Widget>[];
    
    for (var transactionData in widget.data) {
      transactionWidgets.add(
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: TransactionCard(
            icon: Icon(transactionData['icon'],
                color: Colors.black.withOpacity(0.5)),
            type: transactionData['type'],
            currency: 'PHP',
            amount: transactionData['amount'],
            description: transactionData['description'],
            dateTime: DateTime.parse(transactionData['date']),
          ),
        )
      );
    }

    return transactionWidgets;
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
            signedInAccount?.name ?? '',
            style: TextStyle(color: AppColor.secondary, fontSize: 20),
          ),
        ],
      ),
      isTitleCenter: false,
      content: Container(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TransactionSummary(
                totalBalance: widget.totalIncome - widget.totalExpenses,
                totalIncome: widget.totalIncome,
                totalExpenses: widget.totalExpenses,
                currency: widget.currency,
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black.withOpacity(0.5),
                          textStyle: TextStyle(fontSize: 14)),
                      onPressed: () => redirectTo(context, Routes.transactions),
                      child: Text('See all'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: transactions
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
