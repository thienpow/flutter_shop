
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/pages/home.dart';
import 'package:flutter_shop/pages/settings.dart';
import './theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:io';
//import 'package:flutter/services.dart';


void main() {
  SharedPreferences.getInstance().then((prefs) {

    bool isThemeDark = prefs.getBool('isThemeDark');
    if (isThemeDark == null)
      isThemeDark = false;

    runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeChanger>(builder: (_) => ThemeChanger(isThemeDark ? ThemeData.dark() : ThemeData.light()),),
          ],
          child: new App(),
      ),
    );
  });
  
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    
    return MaterialApp(
      //debugShowCheckedModeBanner: false,

      theme: theme.getTheme(),

      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      }
    );
  }


}
