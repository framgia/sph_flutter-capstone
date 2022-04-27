import 'package:sun_flutter_capstone/models/model.dart';

class SpendingLimitController {

  Future<int?> upsert(Spending_limit spending_limit) async {
    final result = await Spending_limit(
      id: spending_limit.id,
      amount: spending_limit.amount,
      start_date: DateTime.now(),
      end_date: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).upsert();
    return result;
  }
}
