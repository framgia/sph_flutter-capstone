import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/state/spending_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/progress_bar.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/pages/transaction_summary.dart';

class Dashboard extends StatefulHookConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  final String firstName = 'Juan Dela';
  final String lastName = 'Dela Cruz';
  final String currency = 'fil';
  final double totalIncome = 50000;
  final double totalExpenses = 30000;

  String _greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning,';
    } else if (hour < 17) {
      return 'Good afternoon,';
    } else
      return 'Good evening,';
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(sessionProvider);
    final spendingAmount = ref.watch(spendingProvider);

    return Template(
      appbarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget._greeting(),
            style: TextStyle(color: AppColor.gray, fontSize: 14),
          ),
          Text(
            '${widget.firstName} ${widget.lastName}',
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
            ],
          ),
        ),
      ),
    );
  }
}
