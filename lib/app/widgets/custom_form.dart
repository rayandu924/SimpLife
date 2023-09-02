import 'package:simplife/global.dart';

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

class TextFieldModel {
  final ValueNotifier<Color> colorTitle;
  final ValueNotifier<Color> colorBorder;
  final FormFieldValidator<dynamic> validator;

  TextFieldModel({
    required this.colorTitle,
    required this.colorBorder,
    required this.validator,
  });
}

class CheckboxModel {
  final ValueNotifier<Color> colorTitle;
  final Color colorCheck;
  final Color colorActive;
  final Color colorBorder;
  final FormFieldValidator<dynamic> validator;

  CheckboxModel({
    required this.colorTitle,
    this.colorCheck = Colors.white,
    this.colorActive = Colors.green,
    this.colorBorder = Colors.red,
    required this.validator,
  });
}

class custom_form extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<FieldModel> fields;
  final Function(Map<String, dynamic>) onSubmit; // <-- Ajoutez cette ligne

  custom_form({
    required this.fields,
    required this.onSubmit,
  }); // <-- Modifiez cette ligne

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          ...fields.map((field) => _buildField(field)).toList(),
          ElevatedButton(
            onPressed: () {
              final form = _formKey.currentState;
              if (form != null && form.validate()) {
                // Sauvegarder les valeurs
                form.save();

                // Récupérer les données du formulaire
                Map<String, dynamic> formData = form.value;
                print(formData);
                onSubmit(formData);
              }
            },
            child: Text('Soumettre'),
          ),
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
