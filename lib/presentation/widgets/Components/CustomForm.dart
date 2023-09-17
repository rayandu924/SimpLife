import 'package:simplife/librairies.dart';

class FieldModel {
  final String type;
  final String name;
  final String title;
  final ValueChanged<dynamic> onChanged;
  final dynamic initialValue;
  final dynamic fieldModel;

  FieldModel({
    required this.type,
    required this.name,
    required this.title,
    required this.onChanged,
    required this.initialValue,
    required this.fieldModel,
  });
}

class CustomForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey;
  final List<FieldModel> fields;
  final Function(Map<String, dynamic>) onSubmit;
  final VoidCallback buttonCallback;

  factory CustomForm({
    required List<FieldModel> fields,
    required Function(Map<String, dynamic>) onSubmit,
  }) {
    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    
    void buttonCallbackFunction() {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        form.save();
        Map<String, dynamic> formData = form.value;
        print(formData);
        onSubmit(formData);
      }
    }

    return CustomForm._(formKey: formKey, fields: fields, onSubmit: onSubmit, buttonCallback: buttonCallbackFunction);
  }

  CustomForm._({
    required GlobalKey<FormBuilderState> formKey,
    required this.fields,
    required this.onSubmit,
    required this.buttonCallback,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...fields.map((field) => _buildField(field)).toList(),
        ],
      ),
    );
  }

  Widget _buildField(FieldModel field) {
    switch (field.type) {
      case 'Checkbox':
        return CustomCheckbox(
          field: field,
        );
      case 'TextField':
        return CustomTextField(
          field: field,
        );
      default:
        return SizedBox.shrink();
    }
  }
}
