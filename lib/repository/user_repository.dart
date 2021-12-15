import 'package:ecommerce/data_provide/data_provider.dart';
import 'package:ecommerce/models/models.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<User> createUser(User user) async {
    return await dataProvider.createUser(user);
  }

  Future<User> loginUser(User user) async {
    return await dataProvider.loginUser(user);
  }

  Future<List<User>> getUsers() async {
    return await dataProvider.getUser();
  }

  Future<void> updateUser(User user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(User user) async {
    await dataProvider.deleteUser(user);
  }
}
