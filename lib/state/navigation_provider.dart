import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';

final navigationProvider = StateProvider((_) => Routes.dashboard);

void setCurrentPage(WidgetRef ref, String route) {
  ref.read(navigationProvider.state).update(
        (state) => route,
      );
}
