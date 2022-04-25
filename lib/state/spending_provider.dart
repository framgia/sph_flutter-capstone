import 'package:hooks_riverpod/hooks_riverpod.dart';

final spendingProvider = StateProvider((_) => 0.75);

void setSpendingAmount(WidgetRef ref, double amount) {
  ref.read(spendingProvider.state).update((state) => amount);
}
