
import 'package:simplife/libraries.dart';

class MyCheckbox extends StatefulWidget {
  final FormFieldModel fieldModel;
  
  MyCheckbox({required this.fieldModel, Key? key}) : super(key: key);

  @override
  MyCheckboxState createState() => MyCheckboxState();
}

class MyCheckboxState extends State<MyCheckbox> {
  bool _value = false;

  bool get currentValue => _value;

  Color get colorTitle => widget.fieldModel.additionalAttributes['colorTitle'] ?? Colors.black;
  Color get colorBorder => widget.fieldModel.additionalAttributes['colorBorder'] ?? Colors.grey;

  @override
  void initState() {
    super.initState();
    _value = widget.fieldModel.initialValue ?? false;
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
              _value = value ?? false;
            });
          },
          // You can add other attributes here if necessary
        ),
      ],
    );
  }
}
