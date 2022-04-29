// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../views/pages/account_settings/account_settings.dart' as _i6;
import '../../views/pages/account_settings/spending_limit.dart' as _i10;
import '../../views/pages/account_settings/update_basic_info.dart' as _i9;
import '../../views/pages/dashboard.dart' as _i3;
import '../../views/pages/notifications.dart' as _i5;
import '../../views/pages/session/register.dart' as _i1;
import '../../views/pages/test/sample_crud.dart' as _i7;
import '../../views/pages/transactions.dart' as _i4;
import '../../views/pages/transactions/add_transaction.dart' as _i8;
import '../../views/widgets/navigation/bottom_navbar.dart' as _i2;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    RegisterRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Register());
    },
    BottomNavBar.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BottomNavBar());
    },
    DashboardRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Dashboard());
    },
    TransactionRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.TransactionsPage());
    },
    NotificationsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NotificationsPage());
    },
    SettingsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AccountSettings());
    },
    SampleCrud.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SampleCrud());
    },
    AddTransactionRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AddTransaction());
    },
    UpdateBasicInfoRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.UpdateBasicInfo());
    },
    SpendingLimitRouter.name: (routeData) {
      final args = routeData.argsAs<SpendingLimitRouterArgs>(
          orElse: () => const SpendingLimitRouterArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.SpendingLimit(key: args.key, amount: args.amount));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(RegisterRouter.name, path: '/'),
        _i11.RouteConfig(BottomNavBar.name, path: '/user', children: [
          _i11.RouteConfig(DashboardRouter.name,
              path: 'dashboard', parent: BottomNavBar.name),
          _i11.RouteConfig(TransactionRouter.name,
              path: 'transactions', parent: BottomNavBar.name),
          _i11.RouteConfig(NotificationsRouter.name,
              path: 'notifications', parent: BottomNavBar.name),
          _i11.RouteConfig(SettingsRouter.name,
              path: 'account_settings', parent: BottomNavBar.name),
          _i11.RouteConfig(SampleCrud.name,
              path: 'sample_crud', parent: BottomNavBar.name),
          _i11.RouteConfig(AddTransactionRouter.name,
              path: 'add_transaction', parent: BottomNavBar.name),
          _i11.RouteConfig(UpdateBasicInfoRouter.name,
              path: 'update_basic_info', parent: BottomNavBar.name),
          _i11.RouteConfig(SpendingLimitRouter.name,
              path: 'spending_limit', parent: BottomNavBar.name)
        ])
      ];
}

/// generated route for
/// [_i1.Register]
class RegisterRouter extends _i11.PageRouteInfo<void> {
  const RegisterRouter() : super(RegisterRouter.name, path: '/');

  static const String name = 'RegisterRouter';
}

/// generated route for
/// [_i2.BottomNavBar]
class BottomNavBar extends _i11.PageRouteInfo<void> {
  const BottomNavBar({List<_i11.PageRouteInfo>? children})
      : super(BottomNavBar.name, path: '/user', initialChildren: children);

  static const String name = 'BottomNavBar';
}

/// generated route for
/// [_i3.Dashboard]
class DashboardRouter extends _i11.PageRouteInfo<void> {
  const DashboardRouter() : super(DashboardRouter.name, path: 'dashboard');

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [_i4.TransactionsPage]
class TransactionRouter extends _i11.PageRouteInfo<void> {
  const TransactionRouter()
      : super(TransactionRouter.name, path: 'transactions');

  static const String name = 'TransactionRouter';
}

/// generated route for
/// [_i5.NotificationsPage]
class NotificationsRouter extends _i11.PageRouteInfo<void> {
  const NotificationsRouter()
      : super(NotificationsRouter.name, path: 'notifications');

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i6.AccountSettings]
class SettingsRouter extends _i11.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'account_settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i7.SampleCrud]
class SampleCrud extends _i11.PageRouteInfo<void> {
  const SampleCrud() : super(SampleCrud.name, path: 'sample_crud');

  static const String name = 'SampleCrud';
}

/// generated route for
/// [_i8.AddTransaction]
class AddTransactionRouter extends _i11.PageRouteInfo<void> {
  const AddTransactionRouter()
      : super(AddTransactionRouter.name, path: 'add_transaction');

  static const String name = 'AddTransactionRouter';
}

/// generated route for
/// [_i9.UpdateBasicInfo]
class UpdateBasicInfoRouter extends _i11.PageRouteInfo<void> {
  const UpdateBasicInfoRouter()
      : super(UpdateBasicInfoRouter.name, path: 'update_basic_info');

  static const String name = 'UpdateBasicInfoRouter';
}

/// generated route for
/// [_i10.SpendingLimit]
class SpendingLimitRouter extends _i11.PageRouteInfo<SpendingLimitRouterArgs> {
  SpendingLimitRouter({_i12.Key? key, String amount = '0.0'})
      : super(SpendingLimitRouter.name,
            path: 'spending_limit',
            args: SpendingLimitRouterArgs(key: key, amount: amount));

  static const String name = 'SpendingLimitRouter';
}

class SpendingLimitRouterArgs {
  const SpendingLimitRouterArgs({this.key, this.amount = '0.0'});

  final _i12.Key? key;

  final String amount;

  @override
  String toString() {
    return 'SpendingLimitRouterArgs{key: $key, amount: $amount}';
  }
}
