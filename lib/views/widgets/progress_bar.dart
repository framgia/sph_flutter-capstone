import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';

class ProgressBar extends StatefulHookConsumerWidget {
  String? label;
  final double progress;
  final Color barColor;
  final Color bgColor;
  final double barSize;
  final String barFontFamily;
  final double barFontSize;
  final double barRadius;

  ProgressBar({
    Key? key,
    this.progress = 0,
    this.label,
    this.barColor = ProgressBarTheme.barColor,
    this.bgColor = ProgressBarTheme.bgColor,
    this.barSize = 25.0,
    this.barFontFamily = 'Inter',
    this.barFontSize = 14,
    this.barRadius = 8,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressBarState();
}

class _ProgressBarState extends ConsumerState<ProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.animateTo(
      widget.progress,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateProgress(double newValue) {
    controller.animateTo(
      newValue,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  List<Text> getPercentValues(double progress) {
    double fillValue = progress * 100;
    String remainingPercetage =
        (fillValue == 0) ? '100.0 %' : doubleToPercent(100 - fillValue);
    return [
      styleText(doubleToPercent(fillValue), false),
      styleText(remainingPercetage, false),
    ];
  }

  Text styleText(String text, bool light) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: widget.barFontFamily,
        fontSize: widget.barFontSize,
        fontWeight: FontWeight.bold,
        color: (light) ? Colors.white : AppColor.onyx,
      ),
    );
  }

  String doubleToPercent(double value) {
    return value <= 0 ? "0 %" : value.toStringAsFixed(2) + "%";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          child: Text(
            widget.label ?? '',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColor.onyx,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(widget.barRadius)),
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, _) {
                  updateProgress(widget.progress);
                  return LayoutBuilder(
                    // Used to get the parent width
                    builder: (
                      BuildContext context,
                      BoxConstraints constraints,
                    ) {
                      return Container(
                        width: constraints.maxWidth * controller.value,
                        height: widget.barSize,
                        color: widget.barColor,
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              height: widget.barSize,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getPercentValues(widget.progress),
              ),
            )
          ],
        ),
      ],
    );
  }
}
