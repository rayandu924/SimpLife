import 'package:simplife/libraries.dart';

class CheckboxModel {
  final ValueNotifier<Color> colorTitle = ValueNotifier<Color>(Colors.orange);
  final Color colorCheck;
  final Color colorActive;
  final Color colorBorder;
  final FormFieldValidator<dynamic> validator;
  final ValueNotifier<bool> variable;
  bool value = false;

  CheckboxModel({
    this.colorCheck = Colors.white,
    this.colorActive = Colors.green,
    this.colorBorder = Colors.red,
    required this.validator,
    required this.variable,
  });
}

class MyCheckbox extends StatefulWidget {
  final FieldModel field;

  MyCheckbox({
    required this.field,
  });

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: widget.field.name,
      title: ValueListenableBuilder<Color>(
        valueListenable: widget.field.fieldModel.colorTitle,
        builder: (context, color, child) {
          return Text(
            widget.field.title,
            style: MyTextStyles.checkBoxTitle.copyWith(color: color),
          );
        },
      ),
      validator: widget.field.fieldModel.validator,
      initialValue: widget.field.initialValue,
      onChanged: (value) => {
        widget.field.fieldModel.value = value,
        widget.field.onChanged(widget.field.fieldModel)
      },
      checkColor: widget.field.fieldModel.colorCheck,
      activeColor: widget.field.fieldModel.colorActive,
      side: BorderSide(color: widget.field.fieldModel.colorBorder, width: 2),
    );
  }
}

void onChangedCheckbox(CheckboxModel checkboxModel) {
  if (checkboxModel.validator(checkboxModel.value) != null) {
    checkboxModel.colorTitle.value = Colors.red;
  } else {
    checkboxModel.colorTitle.value = Colors.green;
    checkboxModel.variable.value = checkboxModel.value;
  }
}