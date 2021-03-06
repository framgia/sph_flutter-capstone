import 'package:intl/intl.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class ExpenseController {
  Future<List<Expense>> index(DateTime? startDate, DateTime? endDate) async {
    if (startDate != null && endDate != null) {
      return await Expense()
          .select()
          .paid_at
          .between(DateTime.parse(DateFormat('yyyy-MM-dd').format(startDate)),
              DateTime.parse(DateFormat('yyyy-MM-dd').format(endDate)))
          .toList();
    }
    return await Expense().select().toList();
  }

  Future<int?> store(Expense expense) async {
    final result = await Expense(
      description: expense.description,
      amount: expense.amount,
      paid_at: expense.paid_at,
      category_id: expense.category_id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();

    return result;
  }

  Future<int?> update(int id, Expense expense) async {
    final result = await Expense(
      id: id,
      description: expense.description,
      amount: expense.amount,
      paid_at: expense.paid_at,
      category_id: expense.category_id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    return result;
  }

  Future<Expense?> show(int id) async {
    Expense? expense = await Expense().getById(id);
    return expense;
  }

  Future<BoolResult> delete(int id) async {
    BoolResult result = await Expense().select().id.equals(id).delete();
    await Transaction().select().transaction_id.equals(id).delete();
    return result;
  }

  Future<double> totalExpence() async {
    double total = 0.0;
    final expenses = await Expense().select().toList();
    for (int i = 0; i < expenses.length; i++) {
      total += expenses[i].amount!.toDouble();
    }
    return total;
  }
}
