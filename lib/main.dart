import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

void main() async {
  Account? _account;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final bool _isInitialized = await ExpenseDBModel().initializeDB();
  if (_isInitialized) {
    _account = await Account().select().toSingle();
  }

  runApp(ProviderScope(
    child: MyApp(authenticated: _account != null),
  ));
}

class MyApp extends HookConsumerWidget {
  final _appRouter = AppRouter();
  final bool authenticated;

  MyApp({Key? key, required this.authenticated}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(accountProvider.notifier).getAccount();
    // runSamples(ref);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: appBarTheme,
        fontFamily: 'Inter',
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
      ),
      routerDelegate: _appRouter.delegate(initialRoutes: [
        if (authenticated) BottomNavBar() else RegisterRouter()
      ]),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

// TODO: remove in the future
Future<bool> runSamples(WidgetRef ref) async {
  const incomeSeeder = [
    {
      'description': 'Salary 1',
      'amount': 50000.0,
    },
    {
      'description': 'Salary 2',
      'amount': 50000.0,
    }
  ];
  const expenseSeeder = [
    {'description': 'expense 1', 'amount': 50000.0, 'category_id': 1},
    {'description': 'expense 2', 'amount': 50000.0, 'category_id': 2}
  ];

  for (var el in incomeSeeder) {
    final result = await Income(
            description: el['description'] as String,
            amount: el['amount'] as double,
            date: DateTime.now(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now())
        .save();

    ref.read(transactionsNotifierProvider.notifier).addTransaction('income', result as int);
  }

  for (var el in expenseSeeder) {
    final result = await Expense(
      description: el['description'] as String,
      amount: el['amount'] as double,
      paid_at: DateTime.now(),
      category_id: el['category_id'] as int,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();

    ref.read(transactionsNotifierProvider.notifier).addTransaction('expense', result as int);
  }

  return true;
}
