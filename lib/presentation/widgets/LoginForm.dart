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
            initialValue: 'test',
            onChanged: onChangedTextFormField,
        ),
    ];
  }

@override
Widget build(BuildContext context) {
  return Form(
    key: _formKey,
    child: Column(
      children: [
        ...[for (var field in loginFormFieldModel)
          CustomTextField(
            field: field,
          ),
        ],
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSubmit(username.value, password.value);
            }
          },
          child: Text('Submit'),
        ),
      ],
    ),
  );
}

}
