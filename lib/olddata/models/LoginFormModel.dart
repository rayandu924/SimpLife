import 'package:simplife/global.dart';

class LoginFormModel {
  final ValueNotifier<String> username = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
}
