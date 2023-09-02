import 'package:simplife/global.dart';

class CustomTextField extends StatefulWidget {
  final FieldModel field;

  CustomTextField({
    required this.field,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: widget.field.fieldModel.colorTitle,
      builder: (context, colorTitle, child) {
        return ValueListenableBuilder<Color>(
          valueListenable: widget.field.fieldModel.colorBorder,
          builder: (context, colorBorder, child) {
            return FormBuilderTextField(
              name: widget.field.name,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorBorder, width: 13),
                  borderRadius: BorderRadius.circular(4)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorBorder, width: 13),
                  borderRadius: BorderRadius.circular(4)
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorBorder, width: 13),
                  borderRadius: BorderRadius.circular(4)
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorBorder, width: 13),
                  borderRadius: BorderRadius.circular(4)
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorBorder, width: 13),
                  borderRadius: BorderRadius.circular(4)
                ),
                labelText: widget.field.title,
                labelStyle: textFielTitle.copyWith(color: colorTitle),
              ),
              style: textFieldHint,
              validator: widget.field.fieldModel.validator,
              initialValue: widget.field.initialValue,
              onChanged: (value) => widget.field.onChanged({value, widget.field.fieldModel}),
            );
          },
        );
      },
    );
  }
}
