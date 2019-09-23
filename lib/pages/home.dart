
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/drawer.dart';
import 'package:flutter_shop/pages/front.dart';
import 'package:flutter_shop/pages/snap.dart';
import 'package:flutter_shop/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    PageController _pageController;
    int _currentPageIndex = 0;

    @override
    void initState() {
      super.initState();
      _pageController = new PageController();
    }

    @override
    void dispose() {
      super.dispose();
      _pageController.dispose();
    }
    
  void _onBarItemTapped(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int index) {
    setState(() {
      this._currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutShop'),
      ),
      body: new PageView(
        children: [
          new Front("Home screen"),
          new Snap("Snap screen"),
          new Cart("Cart screen"),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
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
        currentIndex: _currentPageIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onBarItemTapped,
        
      ),
      drawer: AppDrawer(),
    );
  }
}
