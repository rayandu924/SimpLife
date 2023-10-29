import 'package:simplife/libraries.dart';

class UserRepository {
  final UserDataSource dataSource;
  UserRepository(this.dataSource);

  Future<void> register(UserModel user) async {
    await dataSource.register(user);
  }

  Future<void> login(UserModel user) async {
    await dataSource.login(user);
  }
}
