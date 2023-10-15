import 'package:simplife/libraries.dart';

class FormFieldModel {
  final String name;
  final String title;
  final FormFieldEnum fieldType;
  final dynamic initialValue;
  final Map<String, dynamic> _additionalAttributes;

  FormFieldModel({
    required this.name,
    required this.title,
    required this.fieldType,
    required this.initialValue,
    required Map<String, dynamic> additionalAttributes,
  }) : _additionalAttributes = additionalAttributes;

  Map<String, dynamic> get additionalAttributes => _additionalAttributes;
}

enum FormFieldEnum {
  TEXT,
  CHECKBOX,
  // Future field types can be added here
}
