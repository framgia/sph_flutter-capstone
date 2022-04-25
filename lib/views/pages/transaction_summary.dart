import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/widgets/cards/elevated_card.dart';

class TransactionSummary extends StatelessWidget {
  final double totalBalance;
  final double totalIncome;
  final double totalExpenses;
  final String currency;

  const TransactionSummary({
    Key? key,
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpenses,
    required this.currency,
  }) : super(key: key);

  String _amount(double amount) {
    var format = NumberFormat.simpleCurrency(locale: currency).format(amount);
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      width: 374.0,
      boxColor: AppColor.darkBlue,
      margin: 33.0,
      content: Container(
        height: 156.0,
        padding: const EdgeInsets.symmetric(
          vertical: 17.12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _amount(totalBalance),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.15), // Button color
                            child: InkWell(
                              // Splash color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Income',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.lightGray,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _amount(totalIncome),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.8,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ClipOval(
                          child: Material(
                            color: Color.fromRGBO(
                                255, 255, 255, 0.15), // Button color
                            child: InkWell(
                              // Splash color
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(
                                    Icons.arrow_upward_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Expenses',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.lightGray,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _amount(totalExpenses),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.8,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}