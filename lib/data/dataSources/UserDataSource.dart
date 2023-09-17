import 'package:simplife/librairies.dart';

class UserDataSource {
  final String baseUrl;

  UserDataSource(this.baseUrl);

  Future<void> register(UserModel user) async {
    final response = await post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toMap()),  // <--- Utilisez json.encode ici
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }

  Future<void> login(UserModel user) async {
    final response = await post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toMap()),  // <--- Utilisez json.encode ici
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }
  }
}
