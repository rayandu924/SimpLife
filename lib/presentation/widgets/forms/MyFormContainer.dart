import 'package:simplife/libraries.dart';
class MyFormContainer extends StatelessWidget {
  final MyForm form;
  final String title;
  final String buttonTitle;
  final VoidCallback buttonCallback;

  MyFormContainer({
    required this.form,
    required this.title,
    required this.buttonTitle,
    required this.buttonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 20.0),
        form,
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: buttonCallback,
          child: Text(buttonTitle),
        ),
      ],
    );
  }
}
