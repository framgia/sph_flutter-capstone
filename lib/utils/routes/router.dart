import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/views/pages/home.dart';
import 'package:sun_flutter_capstone/views/pages/sample_with_appbar.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(path: '/', page: Home, initial: true),
  AutoRoute(path: '/sample', page: SamplePageWithAppBar),
])
class $AppRouter {}
