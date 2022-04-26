import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_buttons.dart';

// Refactor receiving of tab details if there's time
class TabLayout extends StatefulWidget {
  final List<String> tabButtonLabels;
  final List<Color> tabColors;
  final List<Widget> tabContents;
  const TabLayout({
    Key? key,
    required this.tabButtonLabels,
    required this.tabColors,
    required this.tabContents,
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
    _tabController =
        TabController(vsync: this, length: widget.tabContents.length);
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
      child: Flex(
        direction: Axis.vertical,
        children: [
          //? FOR TAB BUTTONS
          TabButtons(
            tabController: _tabController,
            tabButtonLabels: widget.tabButtonLabels,
            tabColor: widget.tabColors[index],
          ),
          //? FOR CONTENT
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: TabBarView(
                controller: _tabController,
                children: widget.tabContents,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
