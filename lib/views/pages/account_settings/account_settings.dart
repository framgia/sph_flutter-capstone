import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/controllers/spending_limit_controller.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/spending_limit.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/views/widgets/rounded_background.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/currency_picker.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/update_basic_info.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';

class AccountSettings extends StatefulHookConsumerWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AccountSettingsState();
}

class _AccountSettingsState extends ConsumerState<AccountSettings> {
  final String currency = 'PHP';
  final SpendingLimitController spendingLimitController =
      SpendingLimitController();

  String currentSpendingLimit = '0.0';

  @override
  void initState() {
    super.initState();
    _getSpendingLimit();
  }

  Future<void> _getSpendingLimit() async {
    var now = DateTime.now();
    final spendingLimit = await spendingLimitController.getCurrentSpendingLimit(now);
    setState(() {
      currentSpendingLimit = spendingLimit != null ? spendingLimit.amount.toString() : '0.0';
    });
  }

  @override
  Widget build(BuildContext context) {
    final signedInUser = ref.watch(accountProvider);
    final amountFormat = AmountFormat();

    return Template(
      appbarTitle: Text(
        'Account Settings',
        style: TextStyle(fontSize: 18, color: AppColor.secondary),
      ),
      content: RoundedBackground(
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 39, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                    color: Colors.transparent,
                  ),
                  Text(
                    '${signedInUser?.name}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  UpdateBasicInfo(),
                ],
              ),
              Text(
                signedInUser?.email ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ElevatedCard(
                width: 344.0,
                content: CurrencyPicker(),
              ),
              ElevatedCard(
                  width: 344.0,
                  content: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This month\'s spending limit',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColor.lightGray,
                            ),
                          ),
                          Text(
                            amountFormat.amount(currentSpendingLimit, signedInUser?.currency ?? 'PHP'),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    Spacer(),
                    SpendingLimit(amount: currentSpendingLimit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
