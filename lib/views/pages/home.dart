import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        title: const Text('Sample Project'),
        leading: const AutoBackButton(),
      ),
      routes: const [WelcomeRoute(), LoginRoute(), RegisterRoute()],
    );
  }
}

// AutoTabsScaffold defaults to the first route in the list