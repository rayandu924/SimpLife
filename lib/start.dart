import 'package:simplife/librairies.dart';

void main() {
  final userDataSource = UserDataSource('http://127.0.0.1:5000');
  final userRepository = UserRepositoryImpl(userDataSource);
  final userUseCases = UserUseCases(userRepository);

  runApp(MyApp(userUseCases));
}

class MyApp extends StatelessWidget {
  final UserUseCases userUseCases;

  MyApp(this.userUseCases);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(userUseCases),
    );
  }
}
