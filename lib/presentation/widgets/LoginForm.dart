import 'package:simplife/librairies.dart';

class LoginForm extends StatefulWidget {
  final Function(String, String) onSubmit;
  LoginForm(this.onSubmit);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<String> username = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
  List<FieldModel> loginFormFieldModel = [];

  @override
  void initState() {
    super.initState();
    loginFormFieldModel = [
      FieldModel(
        name: 'username',
        title: 'Username',
        type: 'TextField',
        fieldModel: TextFieldModel(
          validator: ValidatorEmail,
          variable: username,
        ),
        initialValue: 'test',
        onChanged: onChangedTextFormField,
      ),
      FieldModel(
        name: 'password',
        title: 'Password',
        type: 'TextField',
        fieldModel: TextFieldModel(
          validator: ValidatorPassword,
          variable: password,
        ),
        initialValue: 'okkey',
        onChanged: onChangedTextFormField,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MyFormContainer(
      form: MyForm(
        fields: loginFormFieldModel,
        verticalSpacing: 18.0,
      ),
      title: 'Login',
      buttonTitle: 'Login',
      buttonCallback: () {},
    );
  }
}
