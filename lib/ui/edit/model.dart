import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:statefulmodel/statefulmodel.dart';

class EditModel extends Model {
  StreamController<int> _counterController = StreamController<int>();
  Stream get counterStream => _counterController.stream;

  String _password = '';
  String get password => _password;

  void save(FormState passwordState) {
    print('1');
    if(passwordState.validate()) {
      passwordState.save();
    }
    print('password: $_password');
  }

  String validatePassword(String text) {
    print('2');
    return null;
  }

  void savePassword(String text) {
    print('3');
    _password = text;
  }

  @override
  void dispose() {
    _counterController.close();
  }
}
