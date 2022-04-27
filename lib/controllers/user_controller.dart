import 'package:sun_flutter_capstone/models/model.dart';

class UserController {
  Future<Account?>getAccount() async {
   Account? account = await Account().select().toSingle();
    return account;
  }

  Future<int?> upsert(Account account) async {
    Account? fetchedAccount = await getAccount();

    final result = await Account(
      id: fetchedAccount?.id,
      first_name: account.first_name,
      last_name: account.last_name,
      email: account.email,
      currency: account.currency,
      createdAt: account.createdAt,
      updatedAt: account.updatedAt
    ).upsert();
    return result;
  }
}
