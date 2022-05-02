// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../views/pages/account_settings/account_settings.dart' as _i8;
import '../../views/pages/account_settings/spending_limit.dart' as _i11;
import '../../views/pages/account_settings/update_basic_info.dart' as _i10;
import '../../views/pages/dashboard.dart' as _i5;
import '../../views/pages/notifications.dart' as _i7;
import '../../views/pages/session/register.dart' as _i2;
import '../../views/pages/session/splash_screen.dart' as _i1;
import '../../views/pages/test/sample_crud.dart' as _i9;
import '../../views/pages/transactions.dart' as _i6;
import '../../views/pages/transactions/add_transaction.dart' as _i4;
import '../../views/widgets/navigation/bottom_navbar.dart' as _i3;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    SplashScreenRouter.name: (routeData) {
      final args = routeData.argsAs<SplashScreenRouterArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(
              key: args.key, authenticated: args.authenticated));
    },
    RegisterRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Register());
    },
    BottomNavBar.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.BottomNavBar());
    },
    AddTransactionRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AddTransaction());
    },
    DashboardRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.Dashboard());
    },
    TransactionRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.TransactionsPage());
    },
    NotificationsRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.NotificationsPage());
    },
    SettingsRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AccountSettings());
    },
    SampleCrud.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SampleCrud());
    },
    UpdateBasicInfoRouter.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.UpdateBasicInfo());
    },
    SpendingLimitRouter.name: (routeData) {
      final args = routeData.argsAs<SpendingLimitRouterArgs>(
          orElse: () => const SpendingLimitRouterArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.SpendingLimit(key: args.key, amount: args.amount));
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(SplashScreenRouter.name, path: '/'),
        _i12.RouteConfig(RegisterRouter.name, path: '/register'),
        _i12.RouteConfig(BottomNavBar.name, path: '/user', children: [
          _i12.RouteConfig(DashboardRouter.name,
              path: 'dashboard', parent: BottomNavBar.name),
          _i12.RouteConfig(TransactionRouter.name,
              path: 'transactions', parent: BottomNavBar.name),
          _i12.RouteConfig(NotificationsRouter.name,
              path: 'notifications', parent: BottomNavBar.name),
          _i12.RouteConfig(SettingsRouter.name,
              path: 'account_settings', parent: BottomNavBar.name),
          _i12.RouteConfig(SampleCrud.name,
              path: 'sample_crud', parent: BottomNavBar.name),
          _i12.RouteConfig(UpdateBasicInfoRouter.name,
              path: 'update_basic_info', parent: BottomNavBar.name),
          _i12.RouteConfig(SpendingLimitRouter.name,
              path: 'spending_limit', parent: BottomNavBar.name)
        ]),
        _i12.RouteConfig(AddTransactionRouter.name, path: '/transaction/add')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRouter extends _i12.PageRouteInfo<SplashScreenRouterArgs> {
  SplashScreenRouter({_i13.Key? key, required bool authenticated})
      : super(SplashScreenRouter.name,
            path: '/',
            args:
                SplashScreenRouterArgs(key: key, authenticated: authenticated));

  static const String name = 'SplashScreenRouter';
}

class SplashScreenRouterArgs {
  const SplashScreenRouterArgs({this.key, required this.authenticated});

  final _i13.Key? key;

  final bool authenticated;

  @override
  String toString() {
    return 'SplashScreenRouterArgs{key: $key, authenticated: $authenticated}';
  }
}

/// generated route for
/// [_i2.Register]
class RegisterRouter extends _i12.PageRouteInfo<void> {
  const RegisterRouter() : super(RegisterRouter.name, path: '/register');

  static const String name = 'RegisterRouter';
}

/// generated route for
/// [_i3.BottomNavBar]
class BottomNavBar extends _i12.PageRouteInfo<void> {
  const BottomNavBar({List<_i12.PageRouteInfo>? children})
      : super(BottomNavBar.name, path: '/user', initialChildren: children);

  static const String name = 'BottomNavBar';
}

/// generated route for
/// [_i4.AddTransaction]
class AddTransactionRouter extends _i12.PageRouteInfo<void> {
  const AddTransactionRouter()
      : super(AddTransactionRouter.name, path: '/transaction/add');

  static const String name = 'AddTransactionRouter';
}

/// generated route for
/// [_i5.Dashboard]
class DashboardRouter extends _i12.PageRouteInfo<void> {
  const DashboardRouter() : super(DashboardRouter.name, path: 'dashboard');

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [_i6.TransactionsPage]
class TransactionRouter extends _i12.PageRouteInfo<void> {
  const TransactionRouter()
      : super(TransactionRouter.name, path: 'transactions');

  static const String name = 'TransactionRouter';
}

/// generated route for
/// [_i7.NotificationsPage]
class NotificationsRouter extends _i12.PageRouteInfo<void> {
  const NotificationsRouter()
      : super(NotificationsRouter.name, path: 'notifications');

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i8.AccountSettings]
class SettingsRouter extends _i12.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'account_settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i9.SampleCrud]
class SampleCrud extends _i12.PageRouteInfo<void> {
  const SampleCrud() : super(SampleCrud.name, path: 'sample_crud');

  static const String name = 'SampleCrud';
}

/// generated route for
/// [_i10.UpdateBasicInfo]
class UpdateBasicInfoRouter extends _i12.PageRouteInfo<void> {
  const UpdateBasicInfoRouter()
      : super(UpdateBasicInfoRouter.name, path: 'update_basic_info');

  static const String name = 'UpdateBasicInfoRouter';
}

/// generated route for
/// [_i11.SpendingLimit]
class SpendingLimitRouter extends _i12.PageRouteInfo<SpendingLimitRouterArgs> {
  SpendingLimitRouter({_i13.Key? key, String amount = '0.0'})
      : super(SpendingLimitRouter.name,
            path: 'spending_limit',
            args: SpendingLimitRouterArgs(key: key, amount: amount));

  static const String name = 'SpendingLimitRouter';
}

class SpendingLimitRouterArgs {
  const SpendingLimitRouterArgs({this.key, this.amount = '0.0'});

  final _i13.Key? key;

  final String amount;

  @override
  String toString() {
    return 'SpendingLimitRouterArgs{key: $key, amount: $amount}';
  }
}
