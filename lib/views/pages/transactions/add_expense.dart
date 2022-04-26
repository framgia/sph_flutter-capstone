import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/views/widgets/input/date_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/input/selected_field.dart';

class AddExpenseForm extends StatefulWidget {
  AddExpenseForm({Key? key}) : super(key: key);

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final expenseFormKey = GlobalKey<FormState>();

  Map<String, TextEditingController> formInputControllers = {
    'nameController': TextEditingController(),
    'amountController': TextEditingController(),
    'categoryController': TextEditingController(),
    'dateController': TextEditingController(),
  };

  //TODO: change dropdown values here
  List<String> dropdownValues = [
    '',
    'Food and Drink',
    'Bills',
    'Other',
  ];

  onSubmit() {
    if (expenseFormKey.currentState!.validate()) {
      //TODO: Add implementation for submission of form
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${formInputControllers['nameController']!.text}'),
              Text('Amount: ${formInputControllers['amountController']!.text}'),
              Text(
                  'Category: ${formInputControllers['categoryController']!.text}'),
              Text('Date: ${formInputControllers['dateController']!.text}'),
            ],
          ),
        ),
      );
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
                  items: dropdownValues,
                  initialValue: '',
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
                onPressed: onSubmit,
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
