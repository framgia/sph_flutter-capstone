import 'package:intl/intl.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class IncomeController {
  Future<List<Income>> index(DateTime? startDate, DateTime? endDate) async {
    if (startDate != null && endDate != null) {
      return await Income()
          .select()
          .date
          .between(DateTime.parse(DateFormat('yyyy-MM-dd').format(startDate)),
              DateTime.parse(DateFormat('yyyy-MM-dd').format(endDate)))
          .toList();
    }
    return await Income().select().toList();
  }

  Future<int?> store(Income income) async {
    final result = await Income(
      description: income.description,
      amount: income.amount,
      date: income.date,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();

    return result;
  }

  Future<int?> update(int id, Income income) async {
    final result = await Income(
      id: id,
      description: income.description,
      amount: income.amount,
      date: income.date,
      createdAt: income.createdAt,
      updatedAt: DateTime.now(),
    ).save();
    return result;
  }

  Future<Income?> show(int id) async {
    Income? income = await Income().getById(id);
    return income;
  }

  Future<BoolResult> delete(int id) async {
    BoolResult result = await Income().select().id.equals(id).delete();
    await Transaction().select().transaction_id.equals(id).delete();
    return result;
  }

  Future<double> totalIncome() async {
    double total = 0.0;
    final incomes = await Income().select().toList();
    for (int i = 0; i < incomes.length; i++) {
      total += incomes[i].amount!.toDouble();
    }
    return total;
  }
}
