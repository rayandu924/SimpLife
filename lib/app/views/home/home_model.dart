import 'package:simplife/global.dart';

class HomeModel {

  Map<String, Object> fetchData() {

    var data = {
      'name': 'John',
      'age': 30,
      'city': 'New York',
      'spots': '[[10,10],[1,5]]'
    };

    return data;
  }
}
