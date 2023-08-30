import 'package:simplife/global.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final String labelText;
  final FormFieldValidator<String?>? validator;

  CustomTextField({
    required this.name,
    required this.labelText,
    this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<Color> _borderColor = ValueNotifier<Color>(const Color.fromARGB(255, 255, 0, 0));

@override
void initState() {
  super.initState();

  _controller.addListener(() {
    if (widget.validator != null) {
      String? errorText = widget.validator!(_controller.text);
      _borderColor.value = errorText == null ? Colors.green : Colors.red;

      // Force la mise à jour de l'état du champ.
      setState(() {});
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: _borderColor,
      builder: (context, color, child) {
        return FormBuilderTextField(
          name: widget.name,
          controller: _controller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: color, width: 10.0),
            ),
            labelText: widget.labelText,
          ),
          validator: widget.validator,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _borderColor.dispose();
    super.dispose();
  }
}
