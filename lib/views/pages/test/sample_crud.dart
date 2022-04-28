import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:intl/intl.dart';

class SampleCrud extends StatefulHookConsumerWidget {
  const SampleCrud({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SampleCrudState();
}

class _SampleCrudState extends ConsumerState<SampleCrud> {
  ExpenseController expenseHandler = ExpenseController();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _showForm(Expense? snapshot) async {
      final paidAt = DateTime.now();
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now();

      if (snapshot?.id != null) {
        _descriptionController.text = snapshot?.description ?? '';
        _amountController.text = (snapshot?.amount).toString();
      } else {
        _descriptionController.text = '';
        _amountController.text = '';
      }

      showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // this will prevent the soft keyboard from covering the text fields
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                inputController: _amountController,
                hintText: '0.0',
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Expense expense = Expense();
                  expense.category_id = 1;
                  expense.description = _descriptionController.text;
                  expense.amount = double.parse(_amountController.text);
                  expense.paid_at = paidAt;
                  expense.updatedAt = updatedAt;

                  // Save new record
                  if (snapshot?.id == null) {
                    expense.createdAt = createdAt;
                    await expenseHandler.store(expense);
                    setState(() {});
                  } else {
                    final expenseId = snapshot?.id;
                    if (expenseId != null) {
                      await expenseHandler.update(expenseId, expense);
                    }
                    setState(() {});
                  }

                  // Clear the text fields
                  _descriptionController.text = '';
                  _amountController.text = '0';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample CRUD'),
      ),
      body: FutureBuilder(
        initialData: const [],
        future: expenseHandler.index(
            DateTime.parse('2020-01-01T11:00:00.000Z'), DateTime.now()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext cntxt, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].description),
                  subtitle: Text((snapshot.data[index].amount).toString() +
                      ' ' +
                      DateFormat('yyyy-MM-dd')
                          .format(snapshot.data[index].paid_at) +
                      ' category_id: ' +
                      snapshot.data[index].category_id.toString()),
                  trailing: SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showForm(snapshot.data[index]);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await expenseHandler
                                .delete(snapshot.data[index].id);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
