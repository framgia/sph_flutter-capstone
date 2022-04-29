import 'package:sun_flutter_capstone/models/model.dart';

class SpendingLimitController {
  Future<Spending_limit?> getCurrentSpendingLimit(
    DateTime dateNow) async {
    return await Spending_limit()
      .select()
      .start_date
      .lessThanOrEquals(dateNow)
      .and
      .end_date
      .greaterThanOrEquals(dateNow)
      .toSingle();
  }

  Future<int?> upsert(double limitAmount) async {
    var now = DateTime.now();
    Spending_limit? spendingLimit = await getCurrentSpendingLimit(now);
    
    final result = await Spending_limit(
      id: spendingLimit?.id,
      amount: limitAmount,
      start_date: DateTime.now(),
      end_date: DateTime.now().add(Duration(days: 30)),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).upsert();
    return result;
  }
}
