
import 'package:simplife/libraries.dart';

/// A repository class for handling user registration and login operations.
class UserRepository {
  final UserDataSource _userDataSource;

  /// Constructor for [UserRepository].
  ///
  /// [_userDataSource]: The data source for interacting with user data.
  UserRepository(this._userDataSource);

  /// Registers a user with the provided [user] details.
  /// 
  /// Returns a [Future] that completes with `true` if registration is successful,
  /// and `false` otherwise.
  Future<bool> register(UserModel user) async {
    try {
      await _userDataSource.registerUser(user);
      return true;
    } catch (error, stackTrace) {
      print('Login failed: $error');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  /// Logs in a user with the provided [user] credentials.
  /// 
  /// Returns a [Future] that completes with `true` if login is successful,
  /// and `false` otherwise.
  Future<bool> login(UserModel user) async {
    try {
      await _userDataSource.loginUser(user);
      return true;
    } catch (error, stackTrace) {
      print('Login failed: $error');
      print('Stack trace: $stackTrace');
      return false;
    }
  }
}
