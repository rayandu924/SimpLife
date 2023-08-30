import 'package:simplife/global.dart';

class CustomCheckbox extends StatelessWidget {
  final String name;
  final String title;
  final FormFieldValidator<bool?>? validator;

  CustomCheckbox({
    required this.name,
    required this.title,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: name,
      title: Text(title),
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      validator: validator,
    );
  }
}
