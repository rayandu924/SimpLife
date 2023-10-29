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


  Color? colorTitle;
  Color? colorBorder;

  @override
  void initState() {
    super.initState();
    _value = widget.fieldModel.initialValue ?? false;
    colorTitle = widget.fieldModel.additionalAttributes['colorTitle'] ?? Colors.black;
    colorBorder = widget.fieldModel.additionalAttributes['colorBorder'] ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldModel.title,
          style: TextStyle(color: colorTitle),
        ),
        Checkbox(
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
              print(_value);
            });
          },
          // Vous pouvez ajouter d'autres attributs ici si nécessaire
        ),
      ],
    );
  }
}
