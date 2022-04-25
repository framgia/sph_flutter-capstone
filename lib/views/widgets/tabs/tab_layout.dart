import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_buttons.dart';

class TabLayout extends StatefulWidget {
  final Widget firstTab;
  final Widget secondTab;

  const TabLayout({
    Key? key,
    required this.firstTab,
    required this.secondTab,
  }) : super(key: key);

  @override
  State<TabLayout> createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
      child: Column(
        children: [
          //? FOR TAB BUTTONS
          TabButtons(
            tabController: _tabController,
            index: index,
          ),
          //? FOR CONTENT
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: TabBarView(
                controller: _tabController,
                children: [widget.firstTab, widget.secondTab],
              ),
            ),
          )
        ],
      ),
    );
  }
}
