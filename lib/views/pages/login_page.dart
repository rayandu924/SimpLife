import 'package:simplife/global.dart';

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {

  // Create an instance of LoginModel
  final LoginPageModel _loginModel = LoginPageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Column(children: [
        Expanded(
          child: CustomTileLayout(
            tile: const custom_tile(
              backgroundColor: Color.fromARGB(255, 81, 0, 255),
            ),
            topLeft: const Text('Login', style: tileTitle),
            center: custom_form(
              fields: _loginModel.loginFormFieldModel, // Use the loginFormFieldModel here
              onSubmit: (value) {
                print(value);
              },
            ),
          )),
      ]),
    );
  }
}
