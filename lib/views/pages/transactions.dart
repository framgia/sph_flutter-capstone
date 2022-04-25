import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sun_flutter_capstone/controllers/user_controller.dart';
import 'package:sun_flutter_capstone/views/widgets/template.dart';

final UserController User = UserController();

class TransactionsPage extends StatefulHookConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Text>> getUserList() async {
    List<Text> list = List<Text>.empty();
    return await User.index().then(
      (value) => value.map<Text>(
        (element) {
          return Text(element.first_name!);
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      appbarTitle: Text('Transactions Page'),
      content: Center(
          child: FutureBuilder<List<Text>>(
        future: getUserList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Text('Loading');
          }
          return Column(
            children: snapshot.data!
                .map<Widget>(
                  (e) => Container(
                    child: e,
                  ),
                )
                .toList(),
          );
        },
      )),
    );
  }
}
