
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/pages/home.dart';
import 'package:flutter_shop/pages/settings.dart';

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
    return MaterialApp(
      title: 'Flutter Shopping Cart Sample',
      theme: ThemeData(
        //primaryColor: Colors.white,
        //scaffoldBackgroundColor: Colors.white,
        //canvasColor: Colors.black,
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      }
      
    );
  }
}
