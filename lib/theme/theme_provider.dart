

import 'package:flutter/material.dart';
import 'package:notes/theme/theme.dart';

class ThemeProvider extends ChangeNotifier
{
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => themeData == darkTheme;

  set themeData(ThemeData themeData)
  {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme()
  {
    if(_themeData == lightTheme)
    {
      themeData = darkTheme;
    }
    else
    {
      themeData = lightTheme;
    }
    // notifyListeners();
  }
}