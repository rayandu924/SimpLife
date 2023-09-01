import 'package:simplife/global.dart';

class CustomCheckbox extends StatefulWidget {
  final String name;
  final String title;
  final FormFieldValidator<bool?>? validator;
  final bool isRequired;

  CustomCheckbox({
    required this.name,
    required this.title,
    this.validator,
    required this.isRequired,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: widget.name,
      title: Text(widget.title),  // Utilisation de la couleur pour le titre
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      validator: widget.validator,
      activeColor: Colors.green,
      initialValue: false,
    );
  }
}

