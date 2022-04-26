import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/consts/routes.dart';
import 'package:sun_flutter_capstone/utils/routing.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ex',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: AppColor.secondary,
                    ),
                  ),
                  Text(
                    'tra',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: AppColor.light,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 357,
                width: 358,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 42,),
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 27,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Enjelin Morgeana',
                            style: TextStyle(
                                color: AppColor.secondary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 32,),
                          OutlinedButtonText(
                            text: 'Enter Pin',
                            onPressed: () => {
                              navigateTo(context, Routes.dashboard),
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
