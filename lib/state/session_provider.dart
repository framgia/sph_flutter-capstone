import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/models/user.dart';

final defaultUser = User(id: 0, username: 'User');

final sessionProvider = StateProvider((_) => defaultUser);

void setSessionUsername(WidgetRef ref, String username) {
  ref.read(sessionProvider.state).update(
        (state) => User(id: state.id, username: username),
      );
}

void logout(WidgetRef ref) {
  ref.read(sessionProvider.state).update((state) => defaultUser);
}
