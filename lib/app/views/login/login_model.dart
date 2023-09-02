import 'package:simplife/global.dart';

class LoginFormModel {
  String username;
  String email;

  LoginFormModel({
    this.username = '',
    this.email = '',
  });
}

class LoginModel extends ChangeNotifier {

  final LoginFormModel loginFormModel = LoginFormModel();

  final List<FieldModel> loginFormFieldModel = [
    FieldModel(
        name: 'username',
        title: 'Username',
        type: 'TextField',
        fieldModel: TextFieldModel(
            colorTitle: ValueNotifier<Color>(Colors.orange),
            colorBorder: ValueNotifier<Color>(Colors.orange),
            validator: ValidatorEmail,),
        initialValue : 'test',
        onChanged: (value) => onChangedTextFormField(value)
    ),
    FieldModel(
        name: 'acceptTerms',
        title: 'Accept Terms & Conditionsssssssssssssssssssss',
        type: 'Checkbox',
        fieldModel: CheckboxModel(
            colorTitle: ValueNotifier<Color>(Colors.red),
                      validator: ValidatorCheckbox,
        ),
        initialValue : false,
        onChanged: (value) => onChangedCheckbox(value) 
    ),
  ];


}
