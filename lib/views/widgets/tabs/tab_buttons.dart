import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class TabButtons extends StatelessWidget {
  final TabController tabController;
  final int index;

  const TabButtons({
    Key? key,
    required this.tabController,
    required this.index,
  }) : super(key: key);

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
              color: index == 0 ? AppColor.pink : AppColor.darkBlue),
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
          labelColor: Colors.white,
          tabs: const [
            Tab(
              child: Text('Add Expense'),
            ),
            Tab(
              child: Text('Add Income'),
            ),
          ],
        ),
      ),
    );
  }
}
