import 'package:simplife/librairies.dart';

class SignUpFormModel {
  final ValueNotifier<String> email = ValueNotifier<String>('');
  final ValueNotifier<String> username = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
  final ValueNotifier<String> confirmPassword = ValueNotifier<String>('');  
  final ValueNotifier<bool> isAgree = ValueNotifier<bool>(false);
}
