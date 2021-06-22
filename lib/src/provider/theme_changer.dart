
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _isLight = true;

  bool get isLight => _isLight;

  set theme(bool isLight) {
    _isLight = isLight;
    notifyListeners();
  }
}
