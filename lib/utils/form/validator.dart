import 'package:simplife/global.dart';

FormFieldValidator<dynamic> ValidatorCheckbox = (value) {
  if (value == null || !value) {
    return 'Veuillez cocher cette case';
  }
  return null;
};


FormFieldValidator<dynamic> ValidatorEmail = (value) {
  // Regular expression for email validation
  const pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  final regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return 'Veuillez saisir un email';
  } else if (!regExp.hasMatch(value)) {
    return 'Veuillez saisir un email valide';
  }
  return null;
};
