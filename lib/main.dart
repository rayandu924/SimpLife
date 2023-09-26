import 'package:simplife/libraries.dart';

void main() {
  final remoteUserDataSource = RemoteUserDataSource('http://127.0.0.1:5000');
  final userRepository = UserRepositoryImpl(remoteUserDataSource);
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
      theme: MyThemesData.darkTheme,
      home: LoginPage(userUseCases),
    );
  }
}
