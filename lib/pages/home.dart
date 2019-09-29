
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/front.dart';
import 'package:flutter_shop/pages/snap.dart';
import 'package:flutter_shop/pages/cart.dart';
import 'package:flutter_shop/pages/account.dart';
import 'package:flutter_shop/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  PageController _pageController;
  int _currentPageIndex = 0;

  _HomePageState() :
  super();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    
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

  BottomNavigationBarItem getBottomNavigationBarItem(String name, bool isSelected) {
    return BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage("assets/images/bottom/$name.png"),
              color: isSelected ? Colors.red : Colors.black87,
              size: 42.0,
          ),
          title: Text(''),
        );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        getBottomNavigationBarItem('home', _currentPageIndex==0),
        getBottomNavigationBarItem('category', _currentPageIndex==1),
        getBottomNavigationBarItem('cart', _currentPageIndex==2),
        getBottomNavigationBarItem('account', _currentPageIndex==3)
      ],
      currentIndex: _currentPageIndex,
      //selectedItemColor: Colors.amber[800],
      onTap: _onBarItemTapped,
      
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: getBody(),
      
      bottomNavigationBar: getBottomNavigationBar(),
      drawer: AppDrawer(),
    );
  }

  Widget getBody() {
    return 
      PageView(
        children: [
          Front(),
          Snap("Snap screen"),
          Cart("Cart screen"),
          Account("Account screen")
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      );
  }
}


