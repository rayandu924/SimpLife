
import 'package:simplife/libraries.dart';

class LoginPage extends StatelessWidget {
  final UserDataSource userDataSource;
  final UserRepository userRepository;

  LoginPage({required this.userDataSource}) : userRepository = UserRepository(userDataSource);

  void _submitAuthForm(Map<String, dynamic> attributes) {
    // Create a UserModel (pseudo-implementation)
    final UserModel user = UserModel(attributes: attributes);
    userRepository.login(user);
  }

  @override
  Widget build(BuildContext context) {
    // Sample fields for login form
    final fields = [
      TextFieldModel(
        name: "username",
        title: "Username",
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

    final form = MyForm(fields: fields);

    return Scaffold(
      body: Center(
        child: MyFormContainer(
          form: form,
          title: "Login",
          buttonTitle: "Submit",
          buttonCallback: () {
              print(form.currentState?.getFormData() ?? {});
              _submitAuthForm(form.currentState?.getFormData() ?? {});
          },
        ),
      ),
    );
  }
}
