import 'package:sun_flutter_capstone/models/model.dart';

class UserController {
  final userModel = Account();

  Future<List<Account>> index() async {
    return await userModel.select().toList();
  }

  void create(
    String first_name,
    String last_name,
    String email,
    String currency,
  ) async {
    userModel.first_name = first_name;
    userModel.last_name = last_name;
    userModel.email = email;
    userModel.currency = currency;
    userModel.createdAt = DateTime.now();
    userModel.updatedAt = DateTime.now();

    await userModel.save();
  }

  void delete(int id) {
    userModel.select().id.equals(id).delete();
  }

  void clear() {
    userModel.select().delete();
  }
}
