import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sun_flutter_capstone/models/model.dart';
// import 'package:auto_route/auto_route.dart'; Uncomment to use in the future
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  final bool isInitialized = await ExpenseDBModel().initializeDB();
  if (isInitialized) runSamples();

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: appBarTheme,
        fontFamily: 'Inter',
        inputDecorationTheme: inputDecorationTheme,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

Future<bool> runSamples() async {
  // add sample categories
  await addSampleCategories();

  // add sample expenses
  await addSampleExpenses();

  return true;
}

Future<void> addSampleCategories() async {
  final category = await Category().select().toSingle();
  if (category == null) {
    await Category(
      name: 'Food',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Category(
      name: 'Electricity',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Category(
      name: 'Water',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
  }
  return;
}

Future<void> addSampleExpenses() async {
  final expense = await Expense().select().toSingle();
  final category = await Category().select().toSingle();
  DateTime datetime =
      DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  if (expense == null && category != null) {
    await Expense(
      description: 'Lunch',
      amount: 100,
      paid_at: datetime,
      categoryId: category.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Expense(
      description: 'Electricity Bill',
      amount: 1000,
      paid_at: datetime,
      categoryId: category.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    await Expense(
      description: 'Water bill',
      amount: 500,
      paid_at: datetime,
      categoryId: category.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
  }
  return;
}
