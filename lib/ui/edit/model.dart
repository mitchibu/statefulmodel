import 'dart:async';

import 'package:statefulmodel/statefulmodel.dart';

class EditModel extends Model {
  final _obscureTextController = StreamController<bool>();
  Stream get obscureTextStream => _obscureTextController.stream;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void toggleObscureText() {
    _obscureTextController.sink.add(_obscureText = !_obscureText);
  }

  String _password = '';
  String get password => _password;

  void save() {
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
    _obscureTextController.close();
  }
}
