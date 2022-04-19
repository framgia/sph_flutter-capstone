import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Login Route'),
          ElevatedButton(
            onPressed: () => {goToHome(context)},
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
