import 'package:simplife/libraries.dart';

class SignUpPage extends StatelessWidget {
  final dynamic userUseCases;  // Placeholder type for userUseCases

  SignUpPage({required this.userUseCases});

  void _submitSignUpForm(attributes) {
    // Create a UserModel (pseudo-implementation)
    final user = {"attributes": attributes};
    userUseCases.register(user);
  }

  @override
  Widget build(BuildContext context) {
    // Sample fields for sign up form
    final fields = [
      TextFieldModel(
        name: "email",
        title: "Email",
        initialValue: "",
        colorTitle: Colors.orange,
        colorBorder: Colors.orange,
      ),
      TextFieldModel(
        name: "password",
        title: "Password",
        initialValue: "",
        colorTitle: Colors.orange,
        colorBorder: Colors.orange,
      ),
    ];

    return Scaffold(
      body: Center(
        child: MyFormContainer(
          form: MyForm(fields: fields),
          title: "Sign Up",
          buttonTitle: "Register",
          buttonCallback: () => _submitSignUpForm({}),  // Sample attributes
        ),
      ),
    );
  }
}
