import 'package:simplife/libraries.dart';

void main() {
  final userDataSource = UserDataSource('http://127.0.0.1:5000');

  runApp(MyApp(userDataSource));
}

class MyApp extends StatelessWidget {
  final UserDataSource userDataSource;

  MyApp(this.userDataSource);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplife',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
    );
  }
}