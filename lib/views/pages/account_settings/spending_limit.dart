import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class SpendingLimit extends StatelessWidget {
  const SpendingLimit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController amountController = TextEditingController();
    String currency = 'PHP';

    return IconButton(
      icon: const Icon(Icons.edit),
      color: AppColor.lightGray,
      iconSize: 15.0,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(5.0),
      onPressed: () {
        showModalBottomSheet<void>(
          elevation: 5,
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.0),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.only(
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              margin: const EdgeInsets.only(top: 50),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InputGroup(
                          label: 'Update spending limit this month',
                          input: InputField(
                            hintText: '$currency 0.0',
                            inputType: TextInputType.number,
                            inputController: amountController,
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButtonText(
                          text: 'Save',
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Text(
                                    'Values: $currency ${amountController.text}'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
