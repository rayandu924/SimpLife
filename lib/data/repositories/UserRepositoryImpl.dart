
import 'package:simplife/libraries.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<void> register(String email, String password) async {
    final user = UserModel(email: email, password: password);
    await dataSource.register(user);
  }

  @override
  Future<void> login(String email, String password) async {
    final user = UserModel(email: email, password: password);
    await dataSource.login(user);
  }
}
