import 'package:simplife/librairies.dart';

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
      FieldModel(
          name: 'password',
          title: 'Password',
          type: 'TextField',
          fieldModel: TextFieldModel(
            validator: ValidatorPassword,
            variable: loginFormModel.password,
          ),
          initialValue: 'test',
          onChanged: (value) => onChangedCheckbox(value)),
    ];
  }
  void handleFormSubmit(Map<String, dynamic> value) {
    print(value);
  }
}
