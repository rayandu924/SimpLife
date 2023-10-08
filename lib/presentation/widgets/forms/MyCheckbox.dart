import 'package:simplife/libraries.dart';

class MyCheckbox extends StatelessWidget {
  final CheckboxModel fieldModel;

  MyCheckbox({required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldModel.title,
          style: TextStyle(color: fieldModel.colorTitle),
        ),
        FormBuilderCheckbox(
          title: Text(fieldModel.title),
          name: fieldModel.name,
          initialValue: fieldModel.initialValue as bool,
          activeColor: fieldModel.colorActive,
          checkColor: fieldModel.colorCheck,
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
