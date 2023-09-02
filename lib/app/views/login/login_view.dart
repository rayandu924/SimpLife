import 'package:simplife/global.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginModel = LoginModel();

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
          center:custom_form(
          fields: _loginModel.loginFormFieldModel,
          onSubmit: (formData) {
            print(formData);
          },)
        )),
      ]),
  );
}
}

