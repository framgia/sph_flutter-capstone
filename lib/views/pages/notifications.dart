import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/views/widgets/input/date_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class NotificationsPage extends HookConsumerWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

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
                  isNumber: true,
                ),
              ),
              InputGroup(
                label: 'DATE',
                input: DateField(
                  firstDate: DateTime(DateTime.now().year, 1),
                  lastDate: DateTime.now(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Text('Values: ${nameController.text} ${amountController.text}'),
                      ),
                    );
                  }
                },
                child: const Text('sample button to check validation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
