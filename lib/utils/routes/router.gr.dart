// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../views/pages/account_settings.dart' as _i5;
import '../../views/pages/dashboard.dart' as _i2;
import '../../views/pages/notifications.dart' as _i4;
import '../../views/pages/transactions.dart' as _i3;
import '../../views/widgets/navigation/bottom_navbar.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BottomNavBar.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BottomNavBar());
    },
    DashboardRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Dashboard());
    },
    TransactionRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.TransactionsPage());
    },
    NotificationsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NotificationsPage());
    },
    SettingsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AccountSettingsPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(BottomNavBar.name, path: '/', children: [
          _i6.RouteConfig(DashboardRouter.name,
              path: 'dashboard', parent: BottomNavBar.name),
          _i6.RouteConfig(TransactionRouter.name,
              path: 'transactions', parent: BottomNavBar.name),
          _i6.RouteConfig(NotificationsRouter.name,
              path: 'notifications', parent: BottomNavBar.name),
          _i6.RouteConfig(SettingsRouter.name,
              path: 'account_settings', parent: BottomNavBar.name)
        ])
      ];
}

/// generated route for
/// [_i1.BottomNavBar]
class BottomNavBar extends _i6.PageRouteInfo<void> {
  const BottomNavBar({List<_i6.PageRouteInfo>? children})
      : super(BottomNavBar.name, path: '/', initialChildren: children);

  static const String name = 'BottomNavBar';
}

/// generated route for
/// [_i2.Dashboard]
class DashboardRouter extends _i6.PageRouteInfo<void> {
  const DashboardRouter() : super(DashboardRouter.name, path: 'dashboard');

  static const String name = 'DashboardRouter';
}

/// generated route for
/// [_i3.TransactionsPage]
class TransactionRouter extends _i6.PageRouteInfo<void> {
  const TransactionRouter()
      : super(TransactionRouter.name, path: 'transactions');

  static const String name = 'TransactionRouter';
}

/// generated route for
/// [_i4.NotificationsPage]
class NotificationsRouter extends _i6.PageRouteInfo<void> {
  const NotificationsRouter()
      : super(NotificationsRouter.name, path: 'notifications');

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i5.AccountSettingsPage]
class SettingsRouter extends _i6.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'account_settings');

  static const String name = 'SettingsRouter';
}
