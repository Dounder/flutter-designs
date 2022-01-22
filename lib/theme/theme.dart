import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(secondary: Color(0xff48A0EB)),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202B),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
          ),
        );
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;
    _customTheme = false;
    darkTheme
        ? _currentTheme = ThemeData.dark()
        : _currentTheme = ThemeData.light();
    notifyListeners();
  }

  set customTheme(bool customTheme) {
    _customTheme = customTheme;
    _darkTheme = false;
    darkTheme
        ? _currentTheme = ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(secondary: Color(0xff48A0EB)),
            primaryColorLight: Colors.white,
            scaffoldBackgroundColor: const Color(0xff16202B),
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
            ),
          )
        : _currentTheme = ThemeData.light();
    notifyListeners();
  }
}
