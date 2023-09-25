import 'package:simplife/librairies.dart';

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
    return CustomTileLayout(
      tile: const CustomTile (
        backgroundColor: Color.fromARGB(255, 13, 11, 58),
        wrapChild: true,
      ),
      topRight: Text(title, style: TextStyle(fontSize: 20)),
      center: form,
      bottomCenter: ElevatedButton(
        onPressed: () {buttonCallback();},
        child: Text(buttonTitle),
      ),
      contentMargin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
    );
  }
}