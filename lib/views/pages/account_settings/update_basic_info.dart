import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class UpdateBasicInfo extends StatefulHookConsumerWidget {
  const UpdateBasicInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateBasicInfoState();
}

class _UpdateBasicInfoState extends ConsumerState<UpdateBasicInfo> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final signedInUser = ref.watch(accountProvider);

    final TextEditingController nameController =
        TextEditingController(text: signedInUser?.name ?? '');
    final TextEditingController emailController =
        TextEditingController(text: signedInUser?.email ?? '');

    void clearStates() {
      formKey.currentState?.reset();
      setState(() {});
      Navigator.of(context).pop(); // Close the bottom sheet
    }

    void onSubmit() async {
      if (formKey.currentState!.validate()) {
        int? res = await ref.read(accountProvider.notifier).update(
              Account(
                name: nameController.text,
                email: emailController.text,
                currency: signedInUser?.currency,
                createdAt: signedInUser?.createdAt ?? DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            );

        clearStates();
      }
    }

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
                            isRequired: false,
                          ),
                        ),
                        SizedBox(height: 15),
                        OutlinedButtonText(
                          text: 'Save',
                          onPressed: () {
                            onSubmit();
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
