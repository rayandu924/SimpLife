import 'package:simplife/global.dart';
import 'package:simplife/librairies.dart';

class LoginPage extends StatelessWidget {
  final UserUseCases userUseCases;

  LoginPage(this.userUseCases);

  void _submitAuthForm(String email, String password) {
    userUseCases.login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(_submitAuthForm),
      ),
    );
  }
}
