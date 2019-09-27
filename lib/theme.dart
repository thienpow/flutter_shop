import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  ThemeData _themeData;

  ThemeChanger(ThemeData theme) {
    this._themeData = theme;
  }

  getTheme() {

    bool isThemeDark = _themeData == ThemeData.dark();
    
    if (isThemeDark)
      return _themeData;
    else
      return _themeData.copyWith(primaryColor: Colors.green);
  }

  setTheme(ThemeData theme) async {

    SharedPreferences prefs = await _prefs;
    bool isThemeDark = theme == ThemeData.dark();
    await prefs.setBool('isThemeDark', isThemeDark);

    if (isThemeDark)
      _themeData = theme;
    else
      _themeData = theme.copyWith(primaryColor: Colors.green); //Todo: here we can make it follow the options chosen by user instead of forcing light theme equal to green.

    notifyListeners();
  }
}