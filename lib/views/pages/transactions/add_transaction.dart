import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/consts/global_style.dart';
import 'package:sun_flutter_capstone/views/pages/transactions/add_expense.dart';
import 'package:sun_flutter_capstone/views/widgets/tabs/tab_layout.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Template(
      appbarTitle: Text('Add Transaction'),
      content: TabLayout(
        firstTab: AddExpenseForm(),
        secondTab: Container(
          color: AppColor.light,
          alignment: Alignment.center,
          child: Text('Income content'),
        ),
      ),
    );
  }
}
