import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class Template extends StatelessWidget {
  final Widget content;
  final Widget appbarTitle;
  final bool isTitleCenter;
  final List<Widget> appbarActions;
  final bool automaticallyImplyLeading;

  const Template({
    Key? key,
    required this.content,
    required this.appbarTitle,
    this.appbarActions = const [],
    this.isTitleCenter = true,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              top: 0,
              left: 0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppBar(
                  toolbarHeight: 60,
                  title: appbarTitle,
                  actions: appbarActions,
                  centerTitle: isTitleCenter,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: automaticallyImplyLeading,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 60),
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
