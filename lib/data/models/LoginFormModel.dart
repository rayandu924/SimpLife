import 'package:simplife/librairies.dart';

class LoginFormModel {
  final ValueNotifier<String> username = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
}
