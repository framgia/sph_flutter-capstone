import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/floating_action_button.dart';
import 'package:sun_flutter_capstone/views/widgets/navigation/navigation.dart';

class Template extends StatelessWidget {
  final Widget content;
  final Widget appbarTitle;
  final bool isTitleCenter;
  final List<Widget> appbarActions;

  const Template({
    Key? key,
    required this.content,
    required this.appbarTitle,
    this.appbarActions = const [],
    this.isTitleCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.light,
                  AppColor.primary,
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(160, 20),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppBar(
                toolbarHeight: 80,
                title: appbarTitle,
                actions: appbarActions,
                centerTitle: isTitleCenter,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
          SafeArea(
            //child: Expanded(
              //flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 15),
                child: content,
              ),
            //),
          ),
        ],
      ),
      floatingActionButton: const CenterActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Navigation(),
    );
  }
}
