
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/pages/home.dart';
import 'package:flutter_shop/pages/settings.dart';
import 'package:flutter_shop/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:graphql_flutter/graphql_flutter.dart";
import "package:flutter_shop/data/graphQLConfiguration.dart";
//import 'dart:io';


GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

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
          child: GraphQLProvider(
            client: graphQLConfiguration.client,
            child: CacheProvider(child: MyApp()),
          ),
      ),
    );
  });
  
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
