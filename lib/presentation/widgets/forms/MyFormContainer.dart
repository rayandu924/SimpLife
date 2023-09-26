import 'package:simplife/libraries.dart';

class MyFormContainer extends StatelessWidget {
  final Widget form;
  final String title;
  final String buttonTitle;
  final Function() buttonCallback;

  const MyFormContainer({
    required this.form,
    required this.title,
    required this.buttonTitle,
    required this.buttonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return MyTileLayout(
      tile: const MyTile (
        backgroundColor: Color.fromARGB(255, 13, 11, 58),
        wrapChild: true,
      ),
      topLeft: Text(title, style: MyTextStyles.header1),
      center: form,
      bottomCenter: ElevatedButton(
        onPressed: () {buttonCallback();},
        child: Text(buttonTitle),
      ),
      rowMargin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
    );
  }
}