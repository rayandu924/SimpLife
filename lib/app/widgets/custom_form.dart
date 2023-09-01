import 'package:simplife/global.dart';

class FieldModel {
  final String name;
  final String title;
  final String? type;
  final bool isRequired;
  final FormFieldValidator? validator; // Ajout de la fonction de validation ici

  FieldModel({
    required this.name,
    required this.type,
    this.title = '',
    this.isRequired = true,
    this.validator, // Ce champ peut être optionnel selon vos besoins
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
          name: field.name,
          title: field.title,
          validator: field.validator,
          isRequired: field.isRequired,
        );
      case 'TextField':
        return CustomTextField(
          name: field.name,
          labelText: field.title,
          validator: field.validator,
          isRequired: field.isRequired,
        );
      default:
        return SizedBox.shrink();
    }
  }
}
