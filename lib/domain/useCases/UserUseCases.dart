import 'package:simplife/libraries.dart';

class UserUseCases {
  final UserRepository userRepository;

  UserUseCases(this.userRepository);

  Future<void> register(String email, String password) async {
    await userRepository.register(email, password);
  }

  Future<void> login(String email, String password) async {
    await userRepository.login(email, password);
  }
}
