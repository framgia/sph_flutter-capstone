import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/state/session_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/pages/transaction_summary.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  final String firstName = 'Juan Dela';
  final String lastName = 'Dela Cruz';
  final String currency = 'fil';
  final double totalIncome = 50000;
  final double totalExpenses = 30000;

  String _greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning,';
    }
    else if (hour < 17) {
      return 'Good afternoon,';
    }
    else return 'Good evening,';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider);
    return Template(
      appbarTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _greeting(),
            style: TextStyle(color: AppColor.gray, fontSize: 14),
          ),
          Text(
            '$firstName $lastName',
            style: TextStyle(color: AppColor.secondary, fontSize: 20),
          ),
        ],
      ),
      isTitleCenter: false,
      content: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TransactionSummary(
              totalBalance: totalIncome - totalExpenses,
              totalIncome: totalIncome,
              totalExpenses: totalExpenses,
              currency: currency,
            ),
            FilledButtonText(
              text: 'Go To Notifications Page',
              onPressed: () => {navigateTo(context, Routes.notifications)},
            ),
            OutlinedButtonText(
              text: 'Outlined Pink',
              color: AppColor.pink,
              onPressed: () => {},
            ),
            OutlinedButtonText(
              text: 'Outlined Blue',
              onPressed: () => {},
            ),
            ElevatedButton(
              onPressed: () => {navigateTo(context, '/account_settings')},
              child: const Text('Go To Settings'),
            ),
            Visibility(
              visible: user.username != 'User',
              child: ElevatedButton(
                onPressed: () => logout(ref),
                child: const Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
