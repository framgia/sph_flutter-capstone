import 'package:sun_flutter_capstone/models/model.dart';

class UserController {
  Future<Account?> getAccount(String? name) async {
    Account? account = await Account().select().where('name = "$name"').toSingle();
    return account;
  }

  Future<int?> upsert(Account? account) async {
    Account? fetchedAccount = await getAccount(account?.name);

    final result = await Account(
      id: fetchedAccount?.id,
      name: account?.name,
      email: account?.email ?? fetchedAccount?.email,
      currency: account?.currency,
      createdAt: account?.createdAt ?? fetchedAccount?.createdAt,
      updatedAt: DateTime.now()
    ).upsert();

    return result;
  }


  
}
