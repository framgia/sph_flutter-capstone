import 'package:hooks_riverpod/hooks_riverpod.dart';

// create a user class to define the state structure
class User {
  User({required this.id, required this.username});

  final int id;
  final String username;
}

final defaultUser = User(id: 0, username: 'None');

// Provider
final sessionProvider = StateProvider((_) => defaultUser);

// Actions
// Follows state conventions when updating the state
void setSessionUsername(WidgetRef ref, String username) {
  ref.read(sessionProvider.state).update(
        (state) => User(id: state.id, username: username),
      );
}

void logout(WidgetRef ref) {
  ref.read(sessionProvider.state).update((state) => defaultUser);
}
