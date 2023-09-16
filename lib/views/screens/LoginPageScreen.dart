import 'package:simplife/librairies.dart';

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  
  // Create an instance of LoginModel
  final LoginPageModel _loginModel = LoginPageModel();

  @override
  Widget build(BuildContext context) {
    CustomForm customForm = CustomForm (
                  fields: _loginModel.loginFormFieldModel,
                  onSubmit: _loginModel.handleFormSubmit,
                );

    return Scaffold(
      body:Center(child: CustomTileLayout(
                tile: const CustomTile (
                  backgroundColor: Color.fromARGB(255, 13, 11, 58),
                  wrapChild: true,
                ),
                topRight: const Text('Login', style: tileTitle),
                center: customForm,
                bottomCenter: ElevatedButton(
                  onPressed: () {
                     customForm.buttonCallback();
                  },
                  child: Text('Submit'),
                ),
                contentMargin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              ),),
    );
  }
}
