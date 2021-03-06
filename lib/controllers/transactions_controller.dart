import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';
import 'package:sun_flutter_capstone/controllers/income_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'dart:async';

// For repository methods
class TransactionController {
  Future<List<Transaction>>? index() async {
    return await Transaction().select().orderByDesc("createdAt").toList();
  }

  Future<List<Map>> transactionList(int? limit, String? filter) async {
    var query = Transaction().select().orderByDesc("createdAt");
    var data = [];

    if (filter != 'all') {
      query = query.transaction_type.equals(filter);
    }

    if (limit != null && limit > 0) {
      query = query.top(limit);
    }

    data = await query.toList();

    var transactions = <Map>[];

    await Future.forEach(data, <Transaction>(transaction) async {
      if (transaction.transaction_type == 'income') {
        await IncomeController()
            .show(transaction.transaction_id as int)
            .then(<Income>(value) {
          final transform = {
            'description': value.description,
            'type': transaction.transaction_type,
            'amount': value.amount,
            'date': value.date,
          };
          transactions.add(transform);
        });
      } else {
        await ExpenseController()
            .show(transaction.transaction_id as int)
            .then(<Income>(value) {
          final transform = {
            'category_id': value.category_id,
            'description': value.description,
            'type': transaction.transaction_type,
            'amount': value.amount,
            'date': value.paid_at,
          };
          transactions.add(transform);
        });
      }
    });

    // Need to put delay since the function returns without waiting for above processes
    await Future.delayed(const Duration(milliseconds: 500));

    return transactions;
  }

  Future<void> store(int id, String type) async {
    await Transaction(
      transaction_id: id,
      transaction_type: type,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
  }
}

// Providers
final transactionsNotifierProvider =
    StateNotifierProvider<TransactionsNotifier, AsyncValue<List<Map>>>((ref) {
  return TransactionsNotifier(ref.read);
});

final expenseTransactionsProvider =
    StateNotifierProvider<ExpenseTransactionsNotifier, AsyncValue<List<Map>>>(
        (ref) {
  return ExpenseTransactionsNotifier(ref.read);
});

final incomeTransactionsProvider =
    StateNotifierProvider<IncomeTransactionsNotifier, AsyncValue<List<Map>>>(
        (ref) {
  return IncomeTransactionsNotifier(ref.read);
});

// For notifier methods
class TransactionsNotifier extends StateNotifier<AsyncValue<List<Map>>> {
  TransactionsNotifier(
    this.read, [
    AsyncValue<List<Map>>? transactions,
  ]) : super(transactions ?? const AsyncValue.loading()) {
    retrieveTransactions();
  }

  final Reader read;
  AsyncValue<List<Map>>? previousState;

  Future<void> retrieveTransactions() async {
    final transactions =
        await TransactionController().transactionList(null, 'all');
    state = AsyncValue.data(transactions);
  }

  Future<void> addTransaction(String type, int id) async {
    await TransactionController().store(id, type);
    retrieveTransactions();
  }
}

class ExpenseTransactionsNotifier extends StateNotifier<AsyncValue<List<Map>>> {
  ExpenseTransactionsNotifier(
    this.read, [
    AsyncValue<List<Map>>? transactions,
  ]) : super(transactions ?? const AsyncValue.loading()) {
    retrieveTransactions();
  }

  final Reader read;
  AsyncValue<List<Map>>? previousState;

  Future<void> retrieveTransactions() async {
    final transactions =
        await TransactionController().transactionList(null, 'expense');
    state = AsyncValue.data(transactions);
  }
}

class IncomeTransactionsNotifier extends StateNotifier<AsyncValue<List<Map>>> {
  IncomeTransactionsNotifier(
    this.read, [
    AsyncValue<List<Map>>? transactions,
  ]) : super(transactions ?? const AsyncValue.loading()) {
    retrieveTransactions();
  }

  final Reader read;
  AsyncValue<List<Map>>? previousState;

  Future<void> retrieveTransactions() async {
    final transactions =
        await TransactionController().transactionList(null, 'income');
    state = AsyncValue.data(transactions);
  }
}
