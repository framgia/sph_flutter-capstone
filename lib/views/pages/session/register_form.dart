import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/controllers/user_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final UserController userController = UserController();
  final registerFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  onSubmit() async {
    if (registerFormKey.currentState!.validate()) {
      Account account = Account(
        name: nameController.text,
        email: '${nameController.text.toLowerCase().replaceAll(' ', '')}@email.com',
        createdAt: DateTime.now(),
      );
      await userController.upsert(account);
      context.router.replace(BottomNavBar());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          InputGroup(
            label: 'NAME',
            input: InputField(
              inputController: nameController,
              hintText: 'Full Name here',
            ),
          ),
          FilledButtonText(
            text: 'Get Started',
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
