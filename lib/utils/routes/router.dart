import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/views/pages/home.dart';
import 'package:sun_flutter_capstone/views/pages/session/login.dart';
import 'package:sun_flutter_capstone/views/pages/session/register.dart';
import 'package:sun_flutter_capstone/views/pages/welcome.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(path: '/', page: HomePage, children: [
    AutoRoute(path: 'welcome', page: WelcomePage),
    AutoRoute(path: 'login', page: LoginPage),
    AutoRoute(path: 'register', page: RegisterPage),
  ]),
])
class $AppRouter {}

// Notes
// :dynamic_route

// The above routes dont have to be children of the '/' route
// We can simple put it alongside the '/' route
// To test this out you can move the login and register page
// outside of the '/' route
// but inside the routes list

// Build Command
// flutter pub run build_runner build --delete-conflicting-outputs
// This generates the router.gr.dart file
// which the application uses for routing