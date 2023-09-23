import 'package:simplife/librairies.dart';

class MyThemesModel {
  final Color foregroundPrimaryColor;
  final Color foregroundSecondaryColor;
  final Color foregroundTertiaryColor;

  final Color backgroundPrimaryColor;
  final Color backgroundSecondaryColor;
  final Color backgroundTertiaryColor;
  
  const MyThemesModel({
    required this.foregroundPrimaryColor,
    required this.foregroundSecondaryColor,
    required this.foregroundTertiaryColor,
    required this.backgroundPrimaryColor,
    required this.backgroundSecondaryColor,
    required this.backgroundTertiaryColor,
  });
}

class MyThemes {
    static const dark = MyThemesModel(
    foregroundPrimaryColor: MyColors.darkGrey,
    foregroundSecondaryColor: Color(0xFF373737),
    foregroundTertiaryColor: Color(0xFF212121),
    backgroundPrimaryColor: Color(0xFF212121),
    backgroundSecondaryColor: Color(0xFF373737),
    backgroundTertiaryColor: Color(0xFF212121),
  );
}
