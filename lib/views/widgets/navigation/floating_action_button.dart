import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sun_flutter_capstone/utils/routes/router.gr.dart';

class CenterActionButton extends HookConsumerWidget {
  const CenterActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        onPressed: () {
          context.pushRoute(
            BottomNavBar(
              children: const [
                AddTransactionRouter(),
              ],
            ),
          );
        },
        elevation: 0,
        backgroundColor: AppColor.secondary,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
