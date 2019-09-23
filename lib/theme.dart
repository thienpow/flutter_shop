import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  ThemeData _themeData;

  ThemeChanger(ThemeData theme) {
    this._themeData = theme;
  }

   getTheme() {
    return _themeData;
  }

  setTheme(ThemeData theme) async {

    SharedPreferences prefs = await _prefs;
    bool isThemeDark = theme == ThemeData.dark();
    await prefs.setBool('isThemeDark', isThemeDark);

    _themeData = theme;

    notifyListeners();
  }
}