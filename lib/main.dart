
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/pages/home.dart';
import 'package:flutter_shop/pages/settings.dart';
import './theme.dart';

void main() => runApp(
  
  MultiProvider(
      providers: [
        
      ],
      child: App(),
  ),
  
);

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),

      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      }
    );
  }
}
