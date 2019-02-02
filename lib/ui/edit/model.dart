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

  String _title = '';
  String get title => _title;

  String validateTitle(String text) {
    print('title2');
    if(text.isEmpty) return 'Title must not be empty.';
    return null;
  }

  void saveTitle(String text) {
    print('title3');
    _title = text;
  }

  String _category = '';
  String get category => _category;

  String validateCategory(String text) {
    print('category2');
    return null;
  }

  void saveCategory(String text) {
    print('category3');
    _title = text;
  }

  String _account = '';
  String get account => _account;

  String validateAccount(String text) {
    print('account2');
    if(text.isEmpty) return 'Account must not be empty.';
    return null;
  }

  void saveAccount(String text) {
    print('account3');
    _account = text;
  }

  String _password = '';
  String get password => _password;

  String validatePassword(String text) {
    print('password2');
    return null;
  }

  void savePassword(String text) {
    print('password3');
    _password = text;
  }

  String _comment = '';
  String get comment => _comment;

  String validateComment(String text) {
    print('comment2');
    return null;
  }

  void saveComment(String text) {
    print('comment3');
    _account = text;
  }

  void save() {
    print('title: $_title');
    print('password: $_password');
  }

  @override
  void dispose() {
    _obscureTextController.close();
  }
}
