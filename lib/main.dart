import 'package:simplife/libraries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserDataSource userDataSource = UserDataSource('http://127.0.0.1:5000'); 
  late UserRepository userRepository = UserRepository(userDataSource);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplife',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(userRepository: userRepository),
    );
  }
}