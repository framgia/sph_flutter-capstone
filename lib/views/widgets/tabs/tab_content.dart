import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  final Widget firstTab;
  final Widget secondTab;

  const TabContent({
    Key? key,
    required this.firstTab,
    required this.secondTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TabBarView(
        children: [firstTab, secondTab],
      ),
    );
  }
}
