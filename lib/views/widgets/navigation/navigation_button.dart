import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/state/navigation_provider.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';

// TODO: refactor
class NavigationButton extends HookConsumerWidget {
  final IconData icon;
  Color? activeColor;
  Color? inactiveColor;
  String? route;
  IconData? activeIcon;
  bool active;

  NavigationButton({
    Key? key,
    required this.icon,
    this.route,
    this.activeIcon,
    this.activeColor = AppColor.primary,
    this.inactiveColor = AppColor.gray,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    active = ref.watch(navigationProvider) == route;
    activeIcon ??= icon;
    return IconButton(
      icon: Icon(
        active ? activeIcon : icon,
        color: active ? activeColor : inactiveColor,
        size: 40,
      ),
      padding: EdgeInsets.zero,
      onPressed: () {
        if (route == null) return;
        setCurrentPage(ref, route!);
        redirectTo(context, route!);
      },
      splashRadius: 1,
    );
  }
}
