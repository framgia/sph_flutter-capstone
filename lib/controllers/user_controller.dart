import 'package:sun_flutter_capstone/models/model.dart';

class UserController {
  Future<Account?> getAccount() async {
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
      updatedAt: account.updatedAt,
    ).upsert();

    return result;
  }

  checkIfAccountExists(String firstName, String lastName) async {
    Account? user = await Account()
        .select()
        .where('first_name = "$firstName" AND last_name = "$lastName"')
        .toSingle();

    return user != null ? true : false;
  }

  Future<int?> register(String name) async {
    List<String> userName = name.split(' ');
    bool accountExists = await checkIfAccountExists(userName[0], userName[1]);
    final String email = '${name.toLowerCase().replaceAll(' ', '')}@email.com';

    if (accountExists) {
      return 0;
    }

    final result = await Account(
      first_name: userName[0],
      last_name: userName[1],
      email: email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ).save();
    return result;
  }
}
