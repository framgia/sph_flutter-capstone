// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../views/pages/account_settings/update_basic_info.dart' as _i8;
import '../../views/pages/account_settings/account_settings.dart' as _i5;
import '../../views/pages/dashboard.dart' as _i2;
import '../../views/pages/notifications.dart' as _i4;
import '../../views/pages/test/sample_crud.dart' as _i6;
import '../../views/pages/transactions.dart' as _i3;
import '../../views/pages/transactions/add_transaction.dart' as _i7;
import '../../views/widgets/navigation/bottom_navbar.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    BottomNavBar.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BottomNavBar());
    },
    DashboardRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Dashboard());
    },
    TransactionRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.TransactionsPage());
    },
    NotificationsRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NotificationsPage());
    },
    SettingsRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AccountSettings());
    },
    SampleCrud.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SampleCrud());
    },
    AddTransactionRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AddTransaction());
    },
    UpdateBasicInfoRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.UpdateBasicInfo());
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(BottomNavBar.name, path: '/', children: [
          _i9.RouteConfig(DashboardRouter.name,
              path: 'dashboard', parent: BottomNavBar.name),
          _i9.RouteConfig(TransactionRouter.name,
              path: 'transactions', parent: BottomNavBar.name),
          _i9.RouteConfig(NotificationsRouter.name,
              path: 'notifications', parent: BottomNavBar.name),
          _i9.RouteConfig(SettingsRouter.name,
              path: 'account_settings', parent: BottomNavBar.name),
          _i9.RouteConfig(SampleCrud.name,
              path: 'sample_crud', parent: BottomNavBar.name),
          _i9.RouteConfig(AddTransactionRouter.name,
              path: 'add_transaction', parent: BottomNavBar.name),
          _i9.RouteConfig(UpdateBasicInfoRouter.name,
              path: 'update_basic_info', parent: BottomNavBar.name)
        ])
      ];
}

/// generated route for
/// [_i1.BottomNavBar]
class BottomNavBar extends _i9.PageRouteInfo<void> {
  const BottomNavBar({List<_i9.PageRouteInfo>? children})
      : super(BottomNavBar.name, path: '/', initialChildren: children);

  static const String name = 'BottomNavBar';
}

/// generated route for
/// [_i2.Dashboard]
class DashboardRouter extends _i9.PageRouteInfo<void> {
  const DashboardRouter() : super(DashboardRouter.name, path: 'dashboard');

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [_i3.TransactionsPage]
class TransactionRouter extends _i9.PageRouteInfo<void> {
  const TransactionRouter()
      : super(TransactionRouter.name, path: 'transactions');

  static const String name = 'TransactionRouter';
}

/// generated route for
/// [_i4.NotificationsPage]
class NotificationsRouter extends _i9.PageRouteInfo<void> {
  const NotificationsRouter()
      : super(NotificationsRouter.name, path: 'notifications');

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i5.AccountSettings]
class SettingsRouter extends _i9.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'account_settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i6.SampleCrud]
class SampleCrud extends _i9.PageRouteInfo<void> {
  const SampleCrud() : super(SampleCrud.name, path: 'sample_crud');

  static const String name = 'SampleCrud';
}

/// generated route for
/// [_i7.AddTransaction]
class AddTransactionRouter extends _i9.PageRouteInfo<void> {
  const AddTransactionRouter()
      : super(AddTransactionRouter.name, path: 'add_transaction');

  static const String name = 'AddTransactionRouter';
}

/// generated route for
/// [_i8.UpdateBasicInfo]
class UpdateBasicInfoRouter extends _i9.PageRouteInfo<void> {
  const UpdateBasicInfoRouter()
      : super(UpdateBasicInfoRouter.name, path: 'add_transaction');

  static const String name = 'AddTransactionRouter';
}
