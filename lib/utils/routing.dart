import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

void navigateTo(BuildContext context, String route) {
  context.router.pushNamed(route);
}

void redirectTo(BuildContext context, String route) {
  context.router.navigateNamed(route);
}

void goToHome(BuildContext context) {
  context.router.popUntilRoot();
}

