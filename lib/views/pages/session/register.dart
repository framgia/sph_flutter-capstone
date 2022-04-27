import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/pages/session/extra_logo.dart';
import 'package:sun_flutter_capstone/views/pages/session/register_form.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 28,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.primary,
                AppColor.light,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtraLogo(),
              ElevatedCard(
                isBoxShadowExist: false,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 41,
                ),
                content: Column(
                  children: const [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RegisterForm()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
