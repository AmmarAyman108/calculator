import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _input = '', _output = '';
  set input(String value) {
    _input = value;
    notifyListeners();
  }

  String get input => _input;

  set output(String value) {
    _output = value;
    notifyListeners();
  }

  String get output => _output;
}
