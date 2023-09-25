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

class MyForm extends StatelessWidget {
  final List<FieldModel> fields;
  final double verticalSpacing; // ajout d'un attribut pour l'espacement

  const MyForm({
    required this.fields,
    this.verticalSpacing = 10.0, // valeur par défaut à 10.0
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: fields
            .expand((field) => [
                  _buildField(field),
                  Padding(padding: EdgeInsets.only(top: verticalSpacing))
                ])
            .toList()
          ..removeLast(),
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