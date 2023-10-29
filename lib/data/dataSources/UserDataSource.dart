import 'package:simplife/libraries.dart';

/// A data source class for interacting with the server for user data.
class UserDataSource {
  final Client _httpClient;
  final String _baseUrl;

  /// Constructor for [UserDataSource].
  ///
  /// [_httpClient]: The HTTP client for server communication.
  UserDataSource(this._httpClient, this._baseUrl);

  /// Sends user registration data to the server.
  ///
  /// [user]: The user data to be registered.
  /// Returns a [Future] that completes when the operation is done.
  Future<void> registerUser(UserModel user) async {
    final response = await _httpClient.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toMap()),
    );

    if (response.statusCode == 201) {
      // Registration successful
    } else {
      // Registration failed, handle different status codes as needed
      throw Exception('Failed to register user');
    }
  }

  /// Sends user login data to the server.
  ///
  /// [user]: The user credentials for login.
  /// Returns a [Future] that completes when the operation is done.
  Future<void> loginUser(UserModel user) async {
    final response = await _httpClient.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toMap()),
    );

    if (response.statusCode == 200) {
      // Login successful
    } else {
      // Login failed, handle different status codes as needed
      throw Exception('Failed to login user');
    }
  }
}
