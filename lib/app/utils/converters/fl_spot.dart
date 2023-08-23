import 'package:simplife/global.dart';

List<FlSpot> convertStringToFlSpots(String jsonString) {
  List<dynamic> list = jsonDecode(jsonString);
  return list.map((item) => FlSpot(item[0] * 1.0, item[1] * 1.0)).toList();
}