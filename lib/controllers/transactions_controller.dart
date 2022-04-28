import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';
import 'package:sun_flutter_capstone/controllers/income_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'dart:async';

final transactionProvider = FutureProvider<List<Map>>((ref) {
  return TransactionController().transactionList();
});

class TransactionController {
  Future<List<Transaction>>? index() async {
    return await Transaction().select().toList();
  }

  Future<List<Map>> transactionList() async {
    final data = await index();
    var transactions = <Map>[];

    if (data != null) {
      for (var transaction in data) {
        if (transaction.transaction_type == 'income') {
          IncomeController().show(transaction.transaction_id!).then((value) => {
                if (value != null)
                  {
                    transactions.add({
                      'description': value.description,
                      'type': transaction.transaction_type,
                      'amount': value.amount,
                      'date': value.date,
                    })
                  }
              });
        } else {
          ExpenseController()
              .show(transaction.transaction_id!)
              .then((value) => {
                    if (value != null)
                      {
                        transactions.add({
                          'category_id': value.category_id,
                          'description': value.description,
                          'type': transaction.transaction_type,
                          'amount': value.amount,
                          'date': value.paid_at,
                        })
                      }
                  });
        }
      }
    }
    print(transactions);
    return transactions;
  }
}
