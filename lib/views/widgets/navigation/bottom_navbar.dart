import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/floating_action_button.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/navigation_button.dart';

// TODO: If Possible refactor NavigationButton or BottomAppBar children to make them cleaner

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return AutoTabsScaffold(
      routes: [
        DashboardRouter(),
        TransactionRouter(),
        NotificationsRouter(),
        SettingsRouter(),
        SampleCrud(),
        UpdateBasicInfoRouter(),
        SpendingLimitRouter(),
      ],
      resizeToAvoidBottomInset: false,
      floatingActionButton:
          keyboardIsOpened ? SizedBox() : CenterActionButton(),
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
                  icon: MdiIcons.creditCardMultipleOutline,
                  activeIcon: MdiIcons.creditCardMultiple,
                  route: Routes.transactions,
                ),
                const SizedBox(width: 75),
                NavigationButton(
                  icon: Icons.notifications_none_outlined,
                  activeIcon: Icons.notifications_active,
                  // onPressed callback is null, by default the flutter wiil read it disable.
                  route: null,
                ),
                NavigationButton(
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
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
