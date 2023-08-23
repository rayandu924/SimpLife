import 'package:simplife/global.dart';

class FieldModel {
  final String name;
  final String type;
  final bool isRequired;
  final FormFieldValidator? validator; // Ajout de la fonction de validation ici

  FieldModel({
    required this.name,
    required this.type,
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
        return FormBuilderCheckbox(
          name: field.name,
          title: Text(field.name),
          validator:
              field.validator, // Utiliser le validateur du FieldModel ici
        );
      case 'TextField':
        return FormBuilderTextField(
          name: field.name,
          validator:
              field.validator, // Utiliser le validateur du FieldModel ici
        );
      // Ajoutez d'autres cas pour d'autres types de champs selon les besoins
      default:
        return SizedBox
            .shrink(); // Pour les types inconnus, retournez un widget vide
    }
  }
}
