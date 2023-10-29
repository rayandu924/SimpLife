import 'package:simplife/libraries.dart';

class MyTextField extends StatefulWidget {
  final FormFieldModel fieldModel;
  final Key? key;

  MyTextField({this.key, required this.fieldModel}) : super(key: key);

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  String? _value;

  String get currentValue => _value ?? '';

  @override
  Widget build(BuildContext context) {
    Color colorTitle = widget.fieldModel.additionalAttributes['colorTitle'] ?? Colors.black;
    Color colorBorder = widget.fieldModel.additionalAttributes['colorBorder'] ?? Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldModel.title,
          style: TextStyle(color: colorTitle),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Texte Description',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder),
            ),
          ),
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