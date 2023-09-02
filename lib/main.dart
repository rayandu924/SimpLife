import 'package:simplife/global.dart';

void main() => runApp(SimplifeApp());

class SimplifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplife',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
