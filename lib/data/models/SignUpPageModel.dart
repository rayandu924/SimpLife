import 'package:simplife/librairies.dart';

class SignUpPageModel {
  final SignUpFormModel signUpFormModel = SignUpFormModel();

  List<FieldModel> signUpFormFieldModel = [];

  SignUpPageModel() {
    signUpFormFieldModel = [
      FieldModel(
          name: 'email',
          title: 'Email',
          type: 'TextField',
          fieldModel: TextFieldModel(
            validator: ValidatorEmail,
            variable: signUpFormModel.email,
          ),
          initialValue: 'test',
          onChanged: (value) => onChangedTextFormField(value)),
      FieldModel(
          name: 'username',
          title: 'Username',
          type: 'TextField',
          fieldModel: TextFieldModel(
            validator: ValidatorEmail,
            variable: signUpFormModel.username,
          ),
          initialValue: 'test',
          onChanged: (value) => onChangedTextFormField(value)),
      FieldModel(
          name: 'password',
          title: 'Password',
          type: 'TextField',
          fieldModel: TextFieldModel(
            validator: ValidatorPassword,
            variable: signUpFormModel.password,
          ),
          initialValue: 'test',
          onChanged: (value) => onChangedTextFormField(value)),
      FieldModel(
            name: 'isAgree',
            title: 'I agree to the Terms and Conditions',
            type: 'Checkbox',
            fieldModel: CheckboxModel(
              validator: ValidatorCheckbox,
              variable: signUpFormModel.isAgree,
            ),
            initialValue: false,
            onChanged: (value) => onChangedCheckbox(value)),
    ];
  }
  void handleFormSubmit(Map<String, dynamic> value) {
    print(value);
  }
}
