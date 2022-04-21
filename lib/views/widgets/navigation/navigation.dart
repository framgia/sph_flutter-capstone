import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/navigation_button.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 25,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            NavigationButton(icon: Icons.home, iconColor: AppColor.primary),
            NavigationButton(icon: Icons.signal_cellular_alt_outlined),
            SizedBox(width: 75),
            NavigationButton(icon: Icons.notifications_none_outlined),
            NavigationButton(icon: Icons.person_outline_outlined),
          ],
        ),
      ),
    );
  }
}
