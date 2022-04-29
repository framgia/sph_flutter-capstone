import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/income_controller.dart';
import 'package:sun_flutter_capstone/controllers/transactions_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/views/widgets/input/date_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';

class AddIncomeForm extends ConsumerStatefulWidget {
  const AddIncomeForm({Key? key}) : super(key: key);

  @override
  _AddIncomeFormState createState() => _AddIncomeFormState();
}

class _AddIncomeFormState extends ConsumerState<AddIncomeForm> {
  final incomeFormKey = GlobalKey<FormState>();
  final IncomeController incomeHandler = IncomeController();
  List<Income> incomes = []; // TODO: Remove: For testing purposes only

  Map<String, TextEditingController> formInputControllers = {
    'descriptionController': TextEditingController(),
    'amountController': TextEditingController(),
    'dateController': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
  }

  void clearStates() {
    incomeFormKey.currentState?.reset();
    formInputControllers['descriptionController']?.clear();
    formInputControllers['amountController']?.clear();
    formInputControllers['dateController']?.clear();
    setState(() {});
  }

  void onSubmit() async {
    if (incomeFormKey.currentState!.validate()) {
      Income income = Income();
      income.description =
          formInputControllers['descriptionController']?.text ?? '';
      income.amount =
          double.parse(formInputControllers['amountController']?.text ?? '0');
      income.date = DateTime.parse(
          formInputControllers['dateController']?.text ??
              DateTime.now().toString());
      income.createdAt = DateTime.now();
      income.updatedAt = DateTime.now();
      final result = await incomeHandler.store(income);
      ref.read(transactionsNotifierProvider.notifier).addTransaction('income', result as int);
      clearStates();
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
                  inputController:
                      formInputControllers['descriptionController']!,
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
