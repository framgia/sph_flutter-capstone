import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    // Add the state provider to the entire app
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sample Nav',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
