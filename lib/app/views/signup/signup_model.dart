import 'package:simplife/global.dart';

class SignUpModel extends ChangeNotifier {
  String? email;
  String? username;  // Facultatif, selon vos préférences
  String? password;
  String? confirmPassword;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  // Vous pouvez ajouter des méthodes pour gérer la logique d'inscription ici
  // Par exemple, se connecter à une API d'enregistrement
  // N'oubliez pas d'appeler notifyListeners() si le modèle change
}
