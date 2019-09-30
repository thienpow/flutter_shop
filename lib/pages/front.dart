import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/bottomWave.dart';
import 'package:flutter_shop/widgets/featuredCarousel.dart';
import 'package:flutter_shop/widgets/searchAppBar.dart';
import '../widgets/featuredCarousel.dart';

import 'package:english_words/english_words.dart' as words;


class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {

  final List<String> kWords = List.from(Set.from(words.all))..sort(
      (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase())
  );

  SearchAppBarDelegate _searchDelegate;
  
  @override 
  void initState() {
    super.initState();
    _searchDelegate = SearchAppBarDelegate(kWords);
  }

  @override
  void dispose() {
    super.dispose();
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

  Widget getDummySearchButton() {
    return Container(

      color: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.68,
      height: 36,

      child:
      FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.green[800],
        textColor: Colors.grey,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.fromLTRB(30, 2, 10, 2),
        onPressed: () {
          showSearchPage(context, _searchDelegate);
        },
        child: Row(
          children: <Widget>[
            Text(
              "mate 30",
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.35,),
            ImageIcon(
              AssetImage("assets/images/search.png"),
              color: Colors.white,
              size: 42.0,
            ),

          ],
        ),),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      //backgroundColor: Colors.transparent,
      body: CustomScrollView(
        
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(250, this),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(_buildList(context, 50))
            ),
          ],
        ),
    );
  }

  List _buildList(BuildContext context, int count) {
    List<Widget> listItems = List();
    
    //***********  this is required to push the list lower at 220px more. ***********
    listItems.add(SizedBox(height: 280,));


    for (int i = 0; i < count; i++) {
      listItems.add(
        Padding(padding: EdgeInsets.all(0.0),
          child: getTodayHotList(context)
      ));
    }
    return listItems;
  }

  Widget getTodayHotList(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      width: width * 1.0,
      padding: EdgeInsets.fromLTRB(width * 0.1, 0, width * 0.1, 0),
      alignment: FractionalOffset.center,
      child: Column(
        children: <Widget>[
            Row(
              children: <Widget>[
                getProductCard(context, "Apple iPhone 11"),
                getProductCard(context, "Huawei Mate 30"),
              ],
            ),
        ],
      ),
    );
    
    
  }

  Widget getProductCard(BuildContext context, String name) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      
      width: width * .4,
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        alignment: FractionalOffset.center,
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: 300,
              height: 100,
              child: Text('$name'),
            ),),
          
        ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  double expandedHeight;
  _FrontPageState parent;
  MySliverAppBar(double expandedHeight, _FrontPageState parent) { 
      this.expandedHeight = expandedHeight;
      this.parent = parent;
  }

  Widget getRoundButton(String name) {
    return RawMaterialButton(
        constraints: BoxConstraints(maxHeight: 52),
        onPressed: () {},
        child: Image.asset('assets/images/round/$name.png'),
        shape: CircleBorder(),
        elevation: 4.0,
        fillColor: Colors.white,
        //padding: const EdgeInsets.all(0.0),
      );
  }

  Widget getCategoryButtons() {
    return Container(
      //alignment: FractionalOffset.center,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10),
            Wrap(children: <Widget>[
              getRoundButton('allcat'),
              SizedBox(width: 10),
              getRoundButton('mencloth'),
              SizedBox(width: 10),
              getRoundButton('womencloth'),
              SizedBox(width: 10),
              getRoundButton('sports'),
              SizedBox(width: 10),
              getRoundButton('electronics'),
            ]
            ),
            SizedBox(height: 10),
            Wrap(children: <Widget>[
              getRoundButton('phone'),
              SizedBox(width: 10),
              getRoundButton('computer'),
              SizedBox(width: 10),
              getRoundButton('automobiles'),
              SizedBox(width: 10),
              getRoundButton('jewellery'),
              SizedBox(width: 10),
              getRoundButton('garden'),
            ]
            ),
            //Expanded(flex: 1, child: Container(),),
          ]
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [

        // ********* Green Background ************
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
              height: MediaQuery.of(context).size.height * 0.3,

              // ********* Search Button ************
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppBar(
                    title: parent.getDummySearchButton(),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: <Widget>[
                      //Adding the search widget in AppBar
                      //TODO: add important shortcut action here, either wallet or cart.
                    ],
                  ),
                  
                ],
              ),
            ),
        ),

        // ********* Category Round Buttons ************
        Positioned(
          top: 380 - shrinkOffset * 1.1,
          left: MediaQuery.of(context).size.width * .05,
          child: Card(
              //color: Colors.green[800],
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width * .9,
                child: getCategoryButtons(),
              ),
          ),
        ),

        // ********* Featured Slides ************
        
        Positioned(
          top: 92,
          bottom: -110,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
                height: expandedHeight -10,
                width: MediaQuery.of(context).size.width,
                child: FeaturedCarousel(),
              ),
          ),
        ),
        
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}