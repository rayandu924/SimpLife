class UserModel {
  final Map<String, dynamic> _attributes;

  UserModel({Map<String, dynamic>? attributes})
      : _attributes = attributes ?? {};

  // Obtenir un attribut par clé
  dynamic getAttribute(String key) => _attributes[key];

  // Définir un attribut par clé et valeur
  void setAttribute(String key, dynamic value) {
    _attributes[key] = value;
  }

  // Convertir les attributs en une carte
  Map<String, dynamic> toMap() {
    return _attributes;
  }
}
