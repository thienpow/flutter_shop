
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/front.dart';
import 'package:flutter_shop/pages/snap.dart';
import 'package:flutter_shop/pages/cart.dart';
import 'package:flutter_shop/widgets/drawer.dart';
import '../widgets/searchAppBar.dart';

import 'package:english_words/english_words.dart' as words;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> kWords;
  SearchAppBarDelegate _searchDelegate;

  PageController _pageController;
  int _currentPageIndex = 0;

  _HomePageState() : kWords = List.from(Set.from(words.all))..sort(
      (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
  ), 
  super();

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    
    _searchDelegate = SearchAppBarDelegate(kWords);
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

  //Shows Search result
  void showSearchPage(BuildContext context,
    SearchAppBarDelegate searchDelegate) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
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
          icon: Icon(Icons.account_circle),
          title: Text('Me'),
        ),
      ],
      currentIndex: _currentPageIndex,
      //selectedItemColor: Colors.amber[800],
      onTap: _onBarItemTapped,
      
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(children: 
        <Widget>[
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green[900], Colors.green[700]]
                )
              ),
              height: MediaQuery.of(context).size.height * 0.3
            ),
          ),
          Card(
            //shape: CustomShapeBorder(),
            elevation: 0.0,
            color: Colors.transparent,
            margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 100.0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: PageView(
                children: [
                  Front("Front screen"),
                  Snap("Snap screen"),
                  Cart("Cart screen"),
                ],
                onPageChanged: onPageChanged,
                controller: _pageController,
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text('FlutShop'),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                //Adding the search widget in AppBar
                IconButton(
                  tooltip: 'Search',
                  icon: const Icon(Icons.search),
                  //Don't block the main thread
                  onPressed: () {
                    showSearchPage(context, _searchDelegate);
                  },
                ),
              ],),),
        
        ],
      ),
      
      bottomNavigationBar: getBottomNavigationBar(),
      drawer: AppDrawer(),
    );
  }
}


class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}