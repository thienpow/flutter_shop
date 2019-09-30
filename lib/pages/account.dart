import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/global.dart';

import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';

class AccountPage extends StatefulWidget {

  @override
  _AccountPageState createState() => new _AccountPageState(); 
}

class _AccountPageState extends State<AccountPage> {

  _AccountPageState() :
  super();



  _getVersion() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _version = packageInfo.version;
        _buildNumber = packageInfo.buildNumber; 
      });
  }
    

  String _version = "";
  String _buildNumber = "";
  bool _isThemeDark = false;
  ThemeChanger _themeChanger;

  @override
  void initState() { 
    super.initState();
    _getVersion();
  }

  _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  _toggleTheme(bool isDark) {
    
    _themeChanger.setTheme(isDark ? ThemeData.dark() : ThemeData.light());
    
  }


  @override
  Widget build(BuildContext context) {

    _themeChanger = Provider.of<ThemeChanger>(context);
    _isThemeDark = _themeChanger.getTheme() == ThemeData.dark();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 0.0,
          elevation: appBarElevation,
          title: Text("Account"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Theme",
                style: Theme.of(context).textTheme.body2),
          ),
          Container(
              color: Theme.of(context).cardColor,
              child: ListTile(
                //onTap: _toggleTheme(),
                leading: Icon(_isThemeDark ? Icons.brightness_3 : Icons.brightness_7),
                subtitle: Text(_isThemeDark ? "Dark" : "Light"),
                title: Text("Theme"),
                trailing: new Switch(
                  activeColor: Theme.of(context).accentColor,
                  value: _isThemeDark,
                  onChanged: (isDark) {
                    _toggleTheme(isDark);
                  },
                ),
              )),

          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Source Code",
                style: Theme.of(context).textTheme.body2),
          ),
          Container(
            color: Theme.of(context).cardColor,
            child: ListTile(
              title: Text("Version $_version ($_buildNumber)"),
              subtitle: Text("github.com/thienpow/flutter_shop"),
              leading: Icon(Icons.info_outline),
              onTap: () => _launchUrl("https://github.com/thienpow/flutter_shop"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Credit", style: Theme.of(context).textTheme.body2),
          ),
          Container(
            color: Theme.of(context).cardColor,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: "Maintained with love by ",
                  style: Theme.of(context).textTheme.subhead,
                  children: <TextSpan>[
                    TextSpan(text: "@thienpow", style: Theme.of(context).textTheme.subhead
                      .apply(color: Theme.of(context).buttonColor, fontWeightDelta: 2))
                  ]
                )
              ),
              subtitle: Text("https://www.facebook.com/thienpow"),
              leading: Icon(Icons.favorite),
              onTap: () => _launchUrl("https://www.facebook.com/thienpow"),
            ),
          ),
        ],
      ),
    );
  }

}