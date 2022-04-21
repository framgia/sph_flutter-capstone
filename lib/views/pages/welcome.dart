import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => {
              navigateTo(context, '/login'),
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () => {
              navigateTo(context, '/register'),
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
