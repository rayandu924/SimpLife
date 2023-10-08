import 'package:simplife/libraries.dart';

class MyForm extends StatefulWidget {
  final List<FieldModel> fields;
  final double verticalSpacing;

  MyForm({required this.fields, this.verticalSpacing = 10.0});

  @override
  _MyFormState createState() => _MyFormState();

  // Expose currentState of _MyFormState
  _MyFormState? get currentState => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> getFormData() {
    return formKey.currentState?.value ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: widget.fields.map((field) {
          if (field is TextFieldModel) {
            return Padding(
              padding: EdgeInsets.only(bottom: widget.verticalSpacing),
              child: MyTextField(fieldModel: field),
            );
          } else if (field is CheckboxModel) {
            return Padding(
              padding: EdgeInsets.only(bottom: widget.verticalSpacing),
              child: MyCheckbox(fieldModel: field),
            );
          }
          return SizedBox.shrink();  // Default for unknown field types
        }).toList(),
      ),
    );
  }
}
