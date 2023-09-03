import 'package:simplife/global.dart';

//checkbox
void onChangedCheckbox(CheckboxModel checkboxModel) {
  if (checkboxModel.validator(checkboxModel.value) != null) {
    checkboxModel.colorTitle.value = Colors.red;
  } else {
    checkboxModel.colorTitle.value = Colors.green;
    checkboxModel.variable.value = checkboxModel.value;
  }
}

//textFormField
void onChangedTextFormField(TextFieldModel textFieldModel) {
  if (textFieldModel.validator(textFieldModel.value) != null) {
    textFieldModel.colorTitle.value = Colors.orange;
    textFieldModel.colorBorder.value = Colors.orange;
  } else {
    textFieldModel.colorTitle.value = Colors.green;
    textFieldModel.colorBorder.value = Colors.green;
    textFieldModel.variable.value = textFieldModel.value;
  }
}