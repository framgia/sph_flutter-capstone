import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/controllers/user_controller.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class CurrencyPicker extends StatefulWidget {
  const CurrencyPicker({Key? key}) : super(key: key);

  @override
  _CurrencyPicker createState() => _CurrencyPicker();
}

class _CurrencyPicker extends State<CurrencyPicker> {
  String currencyCode = 'PHP';
  UserController userController = UserController();

  Future<void> _changeCurrency(code) async {
    setState(() {
      currencyCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Currency',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.lightGray,
              ),
            ),
            Text(
              currencyCode,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 1.8,
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showCurrencyPicker(
              theme: CurrencyPickerThemeData(
                flagSize: 25,
                titleTextStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                subtitleTextStyle: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).hintColor,
                ),
                backgroundColor: Colors.white,
              ),
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              favorite: [currencyCode],
              searchHint: 'Set a currency',
              onSelect: (Currency currency) async {
                _changeCurrency(currency.code);
                Account account = Account(
                  name: 'Juan Dela Cruz',
                  currency: currency.code,
                );                
                await userController.upsert(account);
              },
            );
          },
          color: AppColor.lightGray,
          iconSize: 15.0,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(0.0),
        ),
      ],
    );
  }
}
