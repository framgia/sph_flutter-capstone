import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColor.light,
                      AppColor.primary,
                    ],
                  ),
                // color: Color(0xFFDCE3F9),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(160, 20),
                ),
              ),
            ),
            SafeArea(
              minimum: const EdgeInsets.only(left: 10.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Good Morning',
                  style: TextStyle(
                    color: Color.fromRGBO(94, 95, 114, 1),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  Text('User Fullname',
                  style: TextStyle(
                    color: Color.fromRGBO(50, 78, 217, 1),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
