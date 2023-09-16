import 'package:simplife/librairies.dart';

class TextFieldModel {
  final ValueNotifier<Color> colorTitle = ValueNotifier<Color>(Colors.orange);
  final ValueNotifier<Color> colorBorder = ValueNotifier<Color>(Colors.orange);
  final FormFieldValidator<dynamic> validator;
  final ValueNotifier<String> variable;
  String value = '';


  TextFieldModel({
    required this.validator,
    required this.variable,
  });
}

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
                labelStyle: textFieldTitle.copyWith(color: colorTitle),
                errorStyle: textFieldError,
              ),
              cursorColor: Colors.white,
              style: textFieldHint,
              validator: widget.field.fieldModel.validator,
              initialValue: widget.field.initialValue,
              onChanged: (value) {
                widget.field.fieldModel.value = value;
                widget.field.onChanged(widget.field.fieldModel);
              },            
            );
          },
        );
      },
    );
  }
}

void onChangedTextFormField(TextFieldModel textFieldModel) {
  if (textFieldModel.validator(textFieldModel.value) != null) {
    textFieldModel.colorTitle.value = Colors.orange;
    textFieldModel.colorBorder.value = Colors.orange;
  } else {
    textFieldModel.colorTitle.value = Colors.green;
    textFieldModel.colorBorder.value = Colors.green;
    textFieldModel.variable.value = textFieldModel.value;
  }
}