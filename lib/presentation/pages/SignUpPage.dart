import 'package:simplife/libraries.dart';

class SignUpPage extends StatelessWidget {
  final UserUseCases userUseCases;

  SignUpPage(this.userUseCases);

  void _submitSignUpForm(String email, String password) {
    userUseCases.register(email, password);
    // Handle success or error here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignUpForm(_submitSignUpForm),
      ),
    );
  }
}