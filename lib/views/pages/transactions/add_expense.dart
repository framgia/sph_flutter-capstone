import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/views/widgets/input/date_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/input/selected_field.dart';
import 'package:sun_flutter_capstone/controllers/expense_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class AddExpenseForm extends StatefulWidget {
  AddExpenseForm({Key? key}) : super(key: key);

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final expenseFormKey = GlobalKey<FormState>();
  ExpenseController expenseHandler = ExpenseController();

  Map<String, TextEditingController> formInputControllers = {
    'nameController': TextEditingController(),
    'amountController': TextEditingController(),
    'categoryController': TextEditingController(),
    'dateController': TextEditingController(),
  };

  void initState() {
    super.initState();
  }

  onSubmit(Expense? snapshot) async {
    if (expenseFormKey.currentState!.validate()) {
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now();

      Expense expense = Expense();
      expense.category_id = int.parse(formInputControllers['categoryController']!.text) + 1;
      expense.description = formInputControllers['nameController']!.text;
      expense.amount =
          double.parse(formInputControllers['amountController']!.text);
      expense.paid_at =
          DateTime.parse(formInputControllers['dateController']!.text);
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
      formInputControllers['nameController']!.clear();
      formInputControllers['amountController']!.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      width: double.infinity,
      margin: 0,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      content: Form(
        key: expenseFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputGroup(
                label: 'NAME',
                input: InputField(
                  hintText: 'What are you spending for?',
                  inputController: formInputControllers['nameController']!,
                ),
              ),
              InputGroup(
                label: 'AMOUNT',
                input: InputField(
                  hintText: 'How much did you spend?',
                  inputType: TextInputType.number,
                  inputController: formInputControllers['amountController']!,
                ),
              ),
              InputGroup(
                label: 'CATEGORY',
                input: SelectInput(
                  items: CategoryList.values.map((e) =>
                    e.name.capitalize()
                  ).toList(),
                  initialValue: 'Food',
                  valueReceiver: (String value) {
                    formInputControllers['categoryController']!.text = value;
                  },
                ),
              ),
              InputGroup(
                label: 'DATE',
                input: DateField(
                  firstDate: DateTime(DateTime.now().year, 1),
                  lastDate: DateTime.now(),
                  dateController: formInputControllers['dateController']!,
                ),
              ),
              OutlinedButtonText(
                onPressed: () => onSubmit(null),
                text: 'Save Expense',
                color: AppColor.pink,
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
