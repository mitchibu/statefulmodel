import 'dart:async';

import 'package:statefulmodel/statefulmodel.dart';

class HomeModel extends Model {
  StreamController<int> _counterController = StreamController<int>();
  Stream get counterStream => _counterController.stream;

  int _counter = 0;
  int get counter => _counter;

  void incement() {
    _counterController.sink.add(++ _counter);
  }

  @override
  void dispose() {
    _counterController.close();
  }
}
