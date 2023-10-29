
import 'package:simplife/libraries.dart';

/// Enum representing different types of form fields.
enum FormFieldEnum {
  TEXT,
  CHECKBOX,
  // Future field types can be added here
}

/// Extension on FormFieldEnum to provide additional functionalities.
extension FormFieldEnumExtension on FormFieldEnum {
  /// Returns a string representation of the enum value.
  String get asString {
    return this.toString().split('.').last;
  }
  
  /// Creates a FormFieldEnum from a string representation.
  static FormFieldEnum fromString(String value) {
    return FormFieldEnum.values.firstWhere((e) => e.asString == value, orElse: () {
      throw ArgumentError('No such enum value: $value');
    });
  }
}

/// Model representing a form field with various attributes.
class FormFieldModel {
  final String name;
  final String title;
  final FormFieldEnum fieldType;
  final dynamic initialValue;
  final Map<String, dynamic> _additionalAttributes;

  /// Constructor for creating a [FormFieldModel] instance.
  /// 
  /// [name]: The name of the form field.
  /// [title]: The title or label of the form field.
  /// [fieldType]: The type of the form field.
  /// [initialValue]: The initial value of the form field.
  /// [additionalAttributes]: Additional attributes for the form field.
  FormFieldModel({
    required this.name,
    required this.title,
    required this.fieldType,
    required this.initialValue,
    required Map<String, dynamic> additionalAttributes,
  })  : _additionalAttributes = additionalAttributes,
        assert(_validateInitialValue(fieldType, initialValue), 'Initial value does not match field type') {
    // Validation for additional attributes based on field type can be added here if necessary
  }

  /// Getter to access the additional attributes.
  Map<String, dynamic> get additionalAttributes => _additionalAttributes;

  /// Validates that the initial value matches the field type.
  static bool _validateInitialValue(FormFieldEnum fieldType, dynamic initialValue) {
    switch (fieldType) {
      case FormFieldEnum.TEXT:
        return initialValue is String;
      case FormFieldEnum.CHECKBOX:
        return initialValue is bool;
      // Add cases for other field types as necessary
      default:
        return false;
    }
  }
}
