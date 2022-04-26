import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/buttons/outline_button_text.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              // height: 250,
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
                      Row(
                        children: const [
                          Text(
                            'ex',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                              color: AppColor.primary,
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
                        height: 30.0,
                      ),
                      Container(
                        height: 357,
                        width: 358,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 27,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(
                              height: 58,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Hello,',
                                    style: TextStyle(
                                      color: AppColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    'Enjelin Morgeana',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButtonText(
                        text: 'Enter Pin',
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ),
              ),
            
    );
  }
}
