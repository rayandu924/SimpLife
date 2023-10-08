import 'package:simplife/libraries.dart';

abstract class FieldModel {
  final String name;
  final String title;
  final dynamic initialValue;

  FieldModel({required this.name, required this.title, required this.initialValue});
}

class TextFieldModel extends FieldModel {
  final Color colorTitle;
  final Color colorBorder;
  final FormFieldValidator<String>? validator;

  TextFieldModel({
    required String name,
    required String title,
    required String initialValue,
    required this.colorTitle,
    required this.colorBorder,
    this.validator,
  }) : super(name: name, title: title, initialValue: initialValue);
}

class CheckboxModel extends FieldModel {
  final Color colorTitle;
  final Color colorCheck;
  final Color colorActive;
  final Color colorBorder;
  final FormFieldValidator<bool>? validator;

  CheckboxModel({
    required String name,
    required String title,
    required bool initialValue,
    required this.colorTitle,
    required this.colorCheck,
    required this.colorActive,
    required this.colorBorder,
    this.validator,
  }) : super(name: name, title: title, initialValue: initialValue);
}
