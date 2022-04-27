import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/spending_limit.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';
import 'package:sun_flutter_capstone/views/widgets/rounded_background.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/currency_picker.dart';
import 'package:sun_flutter_capstone/views/pages/account_settings/update_basic_info.dart';

class AccountSettings extends HookConsumerWidget {
  const AccountSettings({Key? key}) : super(key: key);

  final String firstName = 'Juan Dela';
  final String lastName = 'Dela Cruz';
  final String email = 'juan.delacruz@com.com';
  final String currency = 'PHP';
  final String spendingLimit = '18,000';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      '$firstName $lastName',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    UpdateBasicInfo(),
                  ],
                ),
                Text(
                  email,
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
                            '$currency $spendingLimit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SpendingLimit(),
                    ],
                  ),
                ),
                ElevatedCard(
                  width: 344.0,
                  content: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.power_settings_new_outlined),
                        onPressed: () {
                          print('clicked');
                        },
                        iconSize: 20.0,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(0.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
