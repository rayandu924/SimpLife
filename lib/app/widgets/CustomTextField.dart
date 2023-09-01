import 'package:simplife/global.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final String labelText;
  final FormFieldValidator<String?>? validator;
  final bool isRequired;

  CustomTextField({
    required this.name,
    required this.labelText,
    this.validator,
    required this.isRequired,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<Color> _borderColor = ValueNotifier<Color>(Colors.black);

@override
void initState() {
  super.initState();

  _borderColor.value = widget.isRequired ? Colors.red : Colors.black;
  
  _controller.addListener(() {
    if (widget.validator != null) {
      String? errorText = widget.validator!(_controller.text);
    if (_controller.text.isEmpty) {
      if (widget.isRequired) {
        _borderColor.value = Colors.red;
      } else {
        _borderColor.value = Colors.black;
      }
    } else if (errorText == null) {
      _borderColor.value = Colors.green;
    } else {
      _borderColor.value = Colors.orange;
    }
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
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: color,width: 4.0)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: color,width: 4.0)),
              focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: color,width: 4.0)),
              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: color,width: 4.0)),
              disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: color,width: 4.0)),
              labelText: widget.labelText
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
