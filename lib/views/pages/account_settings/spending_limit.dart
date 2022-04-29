import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/spending_limit_controller.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class SpendingLimit extends StatelessWidget {
  final String amount;

  const SpendingLimit({Key? key, this.amount = '0.0'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController amountController = TextEditingController();
    String currency = 'PHP';
    SpendingLimitController spendingLimitController = SpendingLimitController();

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
                            hintText: '$currency $amount',
                            inputType: TextInputType.number,
                            inputController: amountController,
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButtonText(
                          text: 'Save',
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await spendingLimitController
                                .upsert(double.parse(amountController.text));
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
