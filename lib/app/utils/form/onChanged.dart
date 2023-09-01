import 'package:simplife/global.dart';

//function Onchanged example
void onChangedTest(dynamic value) {
  print(value);
}

//checkbox
void onChangedCheckbox(dynamic value) {
  CheckboxModel checkboxModel = value.elementAt(1) as CheckboxModel;
      print(checkboxModel.validator(value.elementAt(0)));
  if (checkboxModel.validator(value.elementAt(0)) != null) {
    checkboxModel.colorTitle.value = Colors.red;
  } else {
    checkboxModel.colorTitle.value = Colors.green;
  }
  print(checkboxModel);
}

//textFormField
void onChangedTextFormField(dynamic value) {
  TextFieldModel textFieldModel = value.elementAt(1) as TextFieldModel;
  print(textFieldModel.validator(value.elementAt(0)));
  if (textFieldModel.validator(value.elementAt(0)) != null) {
    textFieldModel.colorTitle.value = Colors.orange;
    textFieldModel.colorBorder.value = Colors.orange;
  } else {
    textFieldModel.colorTitle.value = Colors.green;
    textFieldModel.colorBorder.value = Colors.green;
  }
  print(textFieldModel);
}