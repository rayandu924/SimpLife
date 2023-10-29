
import 'package:simplife/libraries.dart';

class MyTextField extends StatefulWidget {
  final FormFieldModel fieldModel;
  
  MyTextField({required this.fieldModel, Key? key}) : super(key: key);

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  late String _value;

  String get currentValue => _value;

  Color get colorTitle => widget.fieldModel.additionalAttributes['colorTitle'] ?? Colors.black;
  Color get colorBorder => widget.fieldModel.additionalAttributes['colorBorder'] ?? Colors.grey;
  String get hintText => widget.fieldModel.additionalAttributes['hintText'] ?? 'Enter text';

  @override
  void initState() {
    super.initState();
    _value = widget.fieldModel.initialValue ?? '';
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
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          // You can add other attributes here if necessary
        ),
      ],
    );
  }
}
