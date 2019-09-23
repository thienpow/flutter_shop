
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/drawer.dart';

import 'package:provider/provider.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  void _onBarItemTapped(int index) {

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('$_currentIndex'),
      ),
      body: DefaultTabController(
          initialIndex: 0,
          
          length: 3,
          child: Scaffold(
            body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
                
              Scaffold(
                
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Catalog here.',
                    ),
                    Text(
                      '',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
                    
              Scaffold(
                
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Snap here.',
                    ),
                    Text(
                      '',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
                    
              Scaffold(
                
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cart here.',
                    ),
                    Text(
                      '',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
            ]),

            bottomNavigationBar: Material(
              elevation: 24.0,
              //here we need to handle the color of the tab bar because it doesn't change automatically following the theme.
              color: theme.getTheme() == ThemeData.dark() ? Colors.black : Colors.blue,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              child: 
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(
                            Icons.home,
                            size: 28.0,
                          ),
                      ),
                      Tab(
                        icon: Icon(
                            Icons.camera,
                            size: 28.0,
                          ),
                      ),
                      Tab(
                        icon: Icon(
                            Icons.shopping_cart,
                            size: 28.0,
                          ),
                      ),
                    ],
                  
                    onTap: _onBarItemTapped,
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    //labelColor: Colors.blueAccent.withOpacity(0.8),
                    //unselectedLabelColor: Colors.blue,
                  ),
                ),
              ),
            ),
        ),
      
      

      drawer: AppDrawer(),
    );
  }
}
