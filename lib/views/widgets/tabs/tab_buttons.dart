import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class TabButtons extends StatelessWidget {
  final TabController tabController;
  final List<String> tabButtonLabels;
  final Color tabColor;

  const TabButtons({
    Key? key,
    required this.tabController,
    required this.tabButtonLabels,
    required this.tabColor
  }) : super(key: key);

  displayButtonLabels() {
    return tabButtonLabels.map(
      (label) {
        return Tab(child: Text(label));
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.light,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TabBar(
            controller: tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: tabColor,
            ),
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
            labelColor: Colors.white,
            tabs: displayButtonLabels()),
      ),
    );
  }
}
