import 'package:simplife/global.dart';

FormFieldValidator<dynamic?> ValidatorCheckbox = (value) {
  if (value == null || !value) {
    return 'Veuillez cocher cette case';
  }
  return null;
};
