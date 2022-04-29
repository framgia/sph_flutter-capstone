import 'package:flutter/material.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/account_controller.dart';
import 'package:sun_flutter_capstone/consts/consts.dart';

class TransactionCard extends ConsumerWidget {
  final Icon icon;
  final String type;
  final String currency;
  final double amount;
  final String description;
  final DateTime dateTime;

  const TransactionCard({
    Key? key,
    this.currency = "PHP",
    this.amount = 0.0,
    this.description = "Sample Description",
    required this.dateTime,
    required this.icon,
    required this.type,
  }) : super(key: key);

  String _amount(double amount) {
    var format = NumberFormat.simpleCurrency(name: currency).format(amount);
    return format;
  }

  String _date(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime justNow = DateTime.now().subtract(Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();
    DateTime yesterday = now.subtract(Duration(days: 1));
    String roughTimeString = DateFormat('jm').format(dateTime);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Today';
    } else if (localDateTime.day == yesterday.day &&
        localDateTime.month == yesterday.month &&
        localDateTime.year == yesterday.year) {
      return 'Yesterday';
    } else if (now.difference(localDateTime).inDays < 6) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return '$weekday';
    }
    return '${DateFormat('MMM dd, yyyy').format(dateTime)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedInUser = ref.watch(accountProvider);
    final amountFormat = AmountFormat();

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: type == 'income' ? AppColor.light : AppColor.lightPink,
            ),
            width: 50,
            child: IconButton(
              icon: icon,
              onPressed: () {},
            ),
          ),
          SizedBox(width: 9),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Text(
                _date(dateTime),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColor.lightGray,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            child: Text(
              (type == 'income' ? '+ ' : '- ') + amountFormat.amount(amount, signedInUser?.currency ?? currency),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: type == 'income' ? AppColor.secondary : AppColor.pink,
              ),
            ),
          )
        ],
      ),
    );
  }
}
