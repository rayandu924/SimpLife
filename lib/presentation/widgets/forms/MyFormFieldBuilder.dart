import 'package:simplife/libraries.dart';

class MyFormFieldBuilder {
  static Widget build(FormFieldModel fieldModel) {
    switch (fieldModel.fieldType) {
      case FormFieldEnum.TEXT:
        return MyTextField(
          fieldModel: fieldModel
        );
      case FormFieldEnum.CHECKBOX:
        return MyCheckbox(
          fieldModel: fieldModel
        );
      default:
        throw Exception('Unknown field type');
    }
  }
}
