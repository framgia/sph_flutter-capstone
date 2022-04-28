import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/filled_button_text.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_field.dart';
import 'package:sun_flutter_capstone/views/widgets/input/input_group.dart';

class RegisterForm extends StatefulHookConsumerWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signedInUser = ref.watch(accountProvider);
    final TextEditingController nameController = TextEditingController();

    onSubmit() async {
      if (registerFormKey.currentState!.validate()) {
        ref.read(accountProvider.notifier).update(
              Account(
                name: nameController.text,
                email: signedInUser?.email ?? '',
                currency: signedInUser?.currency ?? 'PHP',
                createdAt: signedInUser?.createdAt ?? DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            );

        registerFormKey.currentState?.reset();
        setState(() {});
        context.router.replace(BottomNavBar());
      }
    }

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
