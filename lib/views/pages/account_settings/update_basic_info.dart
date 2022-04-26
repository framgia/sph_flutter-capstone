import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class UpdateBasicInfo extends StatelessWidget {
  const UpdateBasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController =
        TextEditingController(text: 'Juan Dela Cruz');
    final TextEditingController emailController =
        TextEditingController(text: 'juan.delacruz@com.com');

    return IconButton(
      icon: const Icon(Icons.edit),
      color: AppColor.lightGray,
      iconSize: 15.0,
      alignment: Alignment.centerLeft,
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InputGroup(
                          label: 'NAME',
                          input: InputField(
                            inputController: nameController,
                          ),
                        ),
                        SizedBox(height: 10),
                        InputGroup(
                          label: 'EMAIL',
                          input: InputField(
                            inputController: emailController,
                            isEmail: true,
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButtonText(
                          text: 'Save',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                      'Values: ${nameController.text} ${emailController.text}'),
                                ),
                              );
                            }
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
