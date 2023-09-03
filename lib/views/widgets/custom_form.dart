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
