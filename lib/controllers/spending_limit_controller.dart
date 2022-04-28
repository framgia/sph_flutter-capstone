import 'package:intl/intl.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class SpendingLimitController {
  Future<List<Spending_limit>> index(
      DateTime? startDate, DateTime? endDate) async {
    if (startDate != null && endDate != null) {
      return await Spending_limit()
          .select()
          .start_date
          .lessThanOrEquals(startDate)
          .and
          .end_date
          .greaterThanOrEquals(endDate)
          .toList();
    }
    return await Spending_limit().select().toList();
  }

  Future<int?> upsert(Spending_limit spending_limit) async {
    final result = await Spending_limit(
      id: spending_limit.id,
      amount: spending_limit.amount,
      start_date: DateTime.now(),
      end_date: DateTime.now().add(Duration(days: 30)),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).upsert();
    return result;
  }
}
