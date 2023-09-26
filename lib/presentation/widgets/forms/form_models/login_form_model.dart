import 'package:simplife/libraries.dart';

List<FieldModel> loginFormFieldModel = [
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
