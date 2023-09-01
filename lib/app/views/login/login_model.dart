import 'package:simplife/global.dart';

class LoginModel extends ChangeNotifier {
  String? email;
  String? password;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  // Vous pouvez ajouter des méthodes pour gérer la logique de connexion ici
  // Par exemple, se connecter à une API d'authentification
  // N'oubliez pas d'appeler notifyListeners() si le modèle change
}
