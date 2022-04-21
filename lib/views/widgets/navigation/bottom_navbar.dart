import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:sun_flutter_capstone/views/pages/dashboard.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/floating_action_button.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/navigation_button.dart';

// TODO: Refactor

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        DashboardRouter(),
        TransactionRouter(),
        NotificationsRouter(),
        SettingsRouter()
      ],
      floatingActionButton: const CenterActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          height: 80,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 25,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationButton(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  route: Routes.dashboard,
                ),
                NavigationButton(
                  icon: Icons.signal_cellular_0_bar_outlined,
                  activeIcon: Icons.signal_cellular_4_bar,
                  route: Routes.transactions,
                ),
                const SizedBox(width: 75),
                NavigationButton(
                  icon: Icons.notifications_none_outlined,
                  activeIcon: Icons.notifications_active,
                  route: Routes.notifications,
                ),
                NavigationButton(
                  icon: Icons.person_outline_outlined,
                  activeIcon: Icons.person,
                  route: Routes.settings,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
