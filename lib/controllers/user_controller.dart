import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sun_flutter_capstone/models/model.dart';

class UserController {
  getAccount(String firstName, String lastName) async {
    List<Account> user = await Account()
        .select(columnsToSelect: ['id'])
        .where('first_name = "$firstName" AND last_name = "$lastName"')
        .toList();

    return user.isNotEmpty ? user.first.id : null;
    // return user.first.id ?? 0;
  }

  Future<int?> upsert(Account account) async {
    final userId = await getAccount(account.first_name!, account.last_name!);

    final result = await Account(
        id: userId,
        first_name: account.first_name,
        last_name: account.last_name,
        email: account.email,
        currency: account.currency,
        createdAt: account.createdAt,
        updatedAt: account.updatedAt
        )
    .upsert();
    return result;
  }
}
