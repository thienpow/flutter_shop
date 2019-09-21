
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/drawer.dart';

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
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$_currentIndex'),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('FlutShop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Snap'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
        currentIndex: _currentIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onBarItemTapped,
        
      ),
      drawer: AppDrawer(),
    );
  }
}
