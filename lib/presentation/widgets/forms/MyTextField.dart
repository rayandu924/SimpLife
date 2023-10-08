import 'package:simplife/libraries.dart';

class MyTextField extends StatelessWidget {
  final TextFieldModel fieldModel;

  MyTextField({required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldModel.title,
          style: TextStyle(color: fieldModel.colorTitle),
        ),
        FormBuilderTextField(
          name: fieldModel.name,
          initialValue: fieldModel.initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: fieldModel.colorBorder),
            ),
          ),
          validator: fieldModel.validator,
        ),
      ],
    );
  }
}
