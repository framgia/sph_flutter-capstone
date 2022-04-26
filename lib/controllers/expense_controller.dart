import 'package:intl/intl.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class ExpenseController {
  Future<List<Expense>> index(DateTime? startDate, DateTime? endDate) async {
    DateTime paidStart = startDate ?? DateTime.now();
    DateTime paidEnd = endDate ?? DateTime.now();

    List<Expense> expenses = await Expense()
        .select()
        .paid_at
        .between(DateTime.parse(DateFormat('yyyy-MM-dd').format(paidStart)),
            DateTime.parse(DateFormat('yyyy-MM-dd').format(paidEnd)))
        // .where('paid_at BETWEEN \'$paidStart\' AND \'$paidEnd\'') // sample
        .toList();

    return expenses;
  }

  Future<int?> store(Expense expense) async {
    final result = await Expense(
      description: expense.description,
      amount: expense.amount,
      paid_at: expense.paid_at,
      categoryId: expense.categoryId,
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
      categoryId: expense.categoryId,
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
    return result;
  }
}
