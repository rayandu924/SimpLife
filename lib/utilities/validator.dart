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
    return 'Veuillez saisir un eeeeeemail valide';
  }
  return null;
};

FormFieldValidator<dynamic> ValidatorPassword = (value) {
  if (value == null || value.isEmpty) {
    return 'Veuillez saisir un mot de passe';
  } else if (value.length < 8) {
    return 'Le mot de passe doit contenir au moins 8 caractères';
  }
  return null;
};
