import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/account_settings.dart';
import 'package:sun_flutter_capstone/views/pages/dashboard.dart';
import 'package:sun_flutter_capstone/views/pages/notifications.dart';
import 'package:sun_flutter_capstone/views/pages/transactions.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/bottom_navbar.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
    path: '/',
    page: BottomNavBar,
    children: [
      AutoRoute(
        path: 'dashboard',
        name: 'DashboardRouter',
        page: Dashboard,
      ),
      AutoRoute(
        path: 'transactions',
        name: 'TransactionRouter',
        page: TransactionsPage,
      ),
      AutoRoute(
        path: 'notifications',
        name: 'NotificationsRouter',
        page: NotificationsPage,
      ),
      AutoRoute(
        path: 'account_settings',
        name: 'SettingsRouter',
        page: AccountSettings,
      ),
    ],
  ),
])
class $AppRouter {}

// * Delete router.gr.dart and run this command after any change
// flutter pub run build_runner build --delete-conflicting-outputs
