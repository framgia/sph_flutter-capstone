import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Register Route'),
          ElevatedButton(
            onPressed: () => {goToHome(context)},
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
