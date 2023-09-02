import 'package:simplife/global.dart';

class CustomCheckbox extends StatefulWidget {
  final FieldModel field;

  CustomCheckbox({
    required this.field,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: widget.field.name,
      title: ValueListenableBuilder<Color>(
        valueListenable: widget.field.fieldModel.colorTitle,
        builder: (context, color, child) {
          return Text(
            widget.field.title,
            style: checkBoxTitle.copyWith(color: color),
          );
        },
      ),
      validator: widget.field.fieldModel.validator,
      initialValue: widget.field.initialValue,
      onChanged: (value) =>
          widget.field.onChanged({value, widget.field.fieldModel}),
      checkColor: widget.field.fieldModel.colorCheck,
      activeColor: widget.field.fieldModel.colorActive,
      side: BorderSide(color: widget.field.fieldModel.colorBorder, width: 2),
    );
  }
}
