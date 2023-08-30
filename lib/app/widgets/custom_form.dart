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
    this.isRequired = false,
    this.validator, // Ce champ peut être optionnel selon vos besoins
  });
}

class custom_form extends StatelessWidget {
  final List<FieldModel> fields;
  final Function(Map<String, dynamic>) onSubmit; // <-- Ajoutez cette ligne

  custom_form(
      {required this.fields,
      required this.onSubmit}); // <-- Modifiez cette ligne

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        children: [
          ...fields.map((field) => _buildField(field)).toList(),
          ElevatedButton(
            onPressed: () {
              final form = FormBuilder.of(context);

              if (form != null && form.validate()) {
                // Sauvegarder les valeurs
                form.save();

                // Récupérer les données du formulaire
                Map<String, dynamic> formData = form.value;
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
      );
    case 'TextField':
      return CustomTextField(
            name: field.name,
            labelText: field.title,
            validator: field.validator,
      );
    default:
      return SizedBox.shrink();
  }
}
}
