import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
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
    runSamples();
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

Future<bool> runSamples() async {
  // add sample categories
  await addSampleCategories();

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
