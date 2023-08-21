import 'package:flutter/material.dart';

class ThemeView extends ChangeNotifier {
  ThemeData _currTheme = ThemeData.light();


  ThemeData getCurrentTheme() {
    return _currTheme;
  }

  void changeTheme(ThemeData newTheme) {
    _currTheme = newTheme;
    notifyListeners();
  }
}
