import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/views/widgets/input/date_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';

class AddIncomeForm extends StatefulWidget {
  AddIncomeForm({Key? key}) : super(key: key);

  @override
  State<AddIncomeForm> createState() => _AddIncomeFormState();
}

class _AddIncomeFormState extends State<AddIncomeForm> {
  final incomeFormKey = GlobalKey<FormState>();

  Map<String, TextEditingController> formInputControllers = {
    'nameController': TextEditingController(),
    'amountController': TextEditingController(),
    'dateController': TextEditingController(),
  };

  onSubmit() {
    if (incomeFormKey.currentState!.validate()) {
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
        key: incomeFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputGroup(
                label: 'NAME',
                input: InputField(
                  hintText: 'Name of income source',
                  inputController: formInputControllers['nameController']!,
                ),
              ),
              InputGroup(
                label: 'AMOUNT',
                input: InputField(
                  hintText: 'How much did you earn?',
                  inputType: TextInputType.number,
                  inputController: formInputControllers['amountController']!,
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
                text: 'Save Income',
                color: AppColor.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
