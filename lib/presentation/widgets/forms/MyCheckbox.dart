import 'package:simplife/libraries.dart';

class MyCheckbox extends StatefulWidget {
  final FormFieldModel fieldModel;
  final Key? key;

  MyCheckbox({this.key, required this.fieldModel}) : super(key: key);

  @override
  MyCheckboxState createState() => MyCheckboxState();
}

class MyCheckboxState extends State<MyCheckbox> {
  bool? _value;

  bool? get currentValue => _value;

  @override
  Widget build(BuildContext context) {
    Color colorTitle = widget.fieldModel.additionalAttributes['colorTitle'] ?? Colors.black;
    Color colorBorder = widget.fieldModel.additionalAttributes['colorBorder'] ?? Colors.grey;
    // Vous pouvez ajouter d'autres couleurs ou attributs ici si nécessaire

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldModel.title,
          style: TextStyle(color: colorTitle),
        ),
        Checkbox(
          value: widget.fieldModel.initialValue as bool,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          // Vous pouvez ajouter d'autres attributs ici si nécessaire
        ),
      ],
    );
  }
}
