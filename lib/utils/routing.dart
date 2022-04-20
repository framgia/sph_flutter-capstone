import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

void navigateTo(BuildContext context, String route) {
  context.router.pushNamed(route);
}

void goToHome(BuildContext context) {
  context.router.popUntilRoot();
}
