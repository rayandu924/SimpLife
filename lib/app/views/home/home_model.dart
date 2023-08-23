import 'package:simplife/app/utils/converters/fl_spot.dart';
import 'package:simplife/global.dart';

class HomeModel {

  Map<String, Object> fetchData() {
    String test = '[[3,7],[0,5]]';

    var data = {
      'name': 'John',
      'age': 30,
      'city': 'New York',
      'spots': convertStringToFlSpots(test)
    };

    return data;
  }
}
