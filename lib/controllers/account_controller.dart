import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sun_flutter_capstone/models/model.dart';

final accountProvider = StateNotifierProvider<AccountController, Account?>(
    (_) => AccountController(null));

class AccountController extends StateNotifier<Account?> {
  AccountController(Account? state) : super(state);

  Future<Account?> getAccount() async {
    Account? account = await Account().select().toSingle();
    state = account;
    return account;
  }

  Future<int?> update(Account account) async {
    Account? fetchedAccount = await getAccount();
    final result = await Account(
      id: fetchedAccount?.id,
      name: account.name,
      email: account.email,
      currency: account.currency,
      createdAt: account.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    ).upsert();

    if (result == null) {
      fetchedAccount = await getAccount();
      state = fetchedAccount;
      return result;
    }

    state = (result > 0) ? account : fetchedAccount;
    return result;
  }

  Future<BoolResult> delete() async {
    Account? fetchedAccount = await getAccount();
    BoolResult result =
        await Account().select().id.equals(fetchedAccount?.id).delete();

    state = (result.success == true) ? null : fetchedAccount;
    return result;
  }
}
