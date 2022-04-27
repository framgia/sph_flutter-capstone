import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/input/date_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/input/selected_field.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class NotificationsPage extends HookConsumerWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    return Template(
      appbarTitle: Text('Notificatons Page'),
      content: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.only(top: 40),
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InputGroup(
                  label: 'NAME',
                  input: InputField(
                    inputController: nameController,
                    hintText: 'Starbucks',
                  ),
                ),
                InputGroup(
                  label: 'AMOUNT',
                  input: InputField(
                    inputController: amountController,
                    hintText: '0.0',
                    inputType: TextInputType.number,
                  ),
                ),
                InputGroup(
                  label: 'DATE',
                  input: DateField(
                    firstDate: DateTime(DateTime.now().year, 1),
                    lastDate: DateTime.now(),
                    dateController: dateController,
                  ),
                ),
                FilledButtonText(
                  text: 'sample button to check validation',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Text(
                              'Values: ${nameController.text} ${amountController.text}'),
                        ),
                      );
                    }
                  },
                ),
                OutlinedButtonText(
                  text: 'Outlined Pink',
                  color: AppColor.pink,
                  onPressed: () => {},
                ),
                OutlinedButtonText(
                  text: 'Outlined Blue',
                  onPressed: () => {},
                ),
                SelectInput(
                  items: const [
                    'Item 1',
                    'Item 2',
                    'Item 3',
                    'Item 4',
                    'Item 5',
                  ],
                  initialValue: 'Item 1',
                  valueReceiver: (String value) {
                    //TODO: use value of select
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Text('Dropdown value: $value'),
                      ),
                    );
                  },
                ),
                OutlinedButtonText(
                  text: 'Sample Crud Page',
                  onPressed: () => {
                    navigateTo(context, Routes.samplecrud),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
