import 'package:simplife/global.dart';

class LoginPageModel {
  final LoginFormModel loginFormModel = LoginFormModel();

  List<FieldModel> loginFormFieldModel = [];

  LoginPageModel() {
    loginFormFieldModel = [
      FieldModel(
          name: 'username',
          title: 'Username',
          type: 'TextField',
          fieldModel: TextFieldModel(
            validator: ValidatorEmail,
            variable: loginFormModel.username,
          ),
          initialValue: 'test',
          onChanged: (value) => onChangedTextFormField(value)),
    ];
  }
}
