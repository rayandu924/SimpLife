import 'package:simplife/librairies.dart';
import 'package:simplife/presentation/styles/MyThemes.dart';

class MyThemesData {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark, 
    primaryColor: MyThemes.dark.foregroundPrimaryColor, 
    scaffoldBackgroundColor: MyThemes.dark.backgroundPrimaryColor,
    // Ajoutez d'autres propriétés de thème si nécessaire
  );
}
