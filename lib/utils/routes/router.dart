import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/account_settings.dart';
import 'package:sun_flutter_capstone/views/pages/dashboard.dart';
import 'package:sun_flutter_capstone/views/pages/notifications.dart';
import 'package:sun_flutter_capstone/views/pages/test/sample_crud.dart';
import 'package:sun_flutter_capstone/views/pages/session/login.dart';
import 'package:sun_flutter_capstone/views/pages/transactions.dart';
import 'package:sun_flutter_capstone/views/pages/transactions/add_transaction.dart';
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
      AutoRoute(
        path: 'sample_crud',
        name: 'SampleCrud',
        page: SampleCrud,
      ),
      AutoRoute(
        path: 'add_transaction',
        page: AddTransaction,
        name: 'AddTransactionRouter',
      ),
       AutoRoute(
        path: 'login',
        name: 'LoginRouter',
        page: Login,
      ),
    ],
  ),
])
class $AppRouter {}

// * Delete router.gr.dart and run this command after any change
// flutter pub run build_runner build --delete-conflicting-outputs
