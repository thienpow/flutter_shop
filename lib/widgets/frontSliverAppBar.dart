
import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart' as words;

import 'package:flutter_shop/widgets/featuredCarousel.dart';
import 'package:flutter_shop/widgets/bottomWave.dart';
import 'package:flutter_shop/widgets/searchAppBar.dart';

class FrontSliverAppBar extends SliverPersistentHeaderDelegate {

  final List<String> kWords = List.from(Set.from(words.all))..sort(
      (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase())
  );


  FrontSliverAppBar(Function funcHandleSearch) { 
    _funcHandleSearch = funcHandleSearch;
    _searchDelegate = SearchAppBarDelegate(kWords);
  }

  double expandedHeight = 218;

  Function _funcHandleSearch;
  SearchAppBarDelegate _searchDelegate;
  
  
  //Shows Search result
  void showSearchPage(BuildContext context, SearchAppBarDelegate searchDelegate) async {

    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );

    if (selected != null) {
      
      //callback to let front page handle the query to server for the result being searched.
      _funcHandleSearch("$selected");

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Retrieving data for: $selected'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [

        // ********* Top AppBar with curve Background ************
        ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: shrinkOffset < 80 ? [Colors.redAccent[700], Colors.red[700]] : [Colors.white, Colors.white70]
                )
              ),

              // ********* Search Button ************
              child: AppBar(
                    primary: true,
                    title: getDummySearchButton(context),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: <Widget>[
                      //Adding the search widget in AppBar
                      //TODO: add important shortcut action here, either wallet or cart.
                    ],
                  ),
            ),
        ),

        // ********* Category Round Buttons ************
        Positioned(
          top: 250 - shrinkOffset * 0.75,
          left: MediaQuery.of(context).size.width * .05,
          child: Card(
              //color: Colors.green[800],
              color: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width * .9,
                child: getCategoryButtons(shrinkOffset),
              ),
          ),
        ),

        // ********* Featured Slides ************
        
        Positioned(
          left: 8,
          top: 106,
          right: 8,
          bottom: -16,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width,
                child: FeaturedCarousel(),
              ),
          ),
        ),
        
      ],
    );
  }


  Widget getDummySearchButton(BuildContext context, ) {

    double width = MediaQuery.of(context).size.width;
    double buttonWidth = width * .9;

    return Container(
      padding: EdgeInsets.fromLTRB(width * .1, 0, width * .08, 0),
      color: Colors.transparent,
      width: buttonWidth,
      height: 36,

      child:
      FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.redAccent[700],
        textColor: Colors.white70,
        //disabledColor: Colors.white10,
        //disabledTextColor: Colors.white10,
        padding: EdgeInsets.fromLTRB(buttonWidth * .08, 2, buttonWidth * .05, 2),
        onPressed: () {
          showSearchPage(context, _searchDelegate);
        },
        child: Row(
          children: <Widget>[
            
            Expanded(
              child: Text("搜索 Search", style: TextStyle(fontSize: 14.0),),
            ),

            ImageIcon(
              AssetImage("assets/images/search.png"),
              color: Colors.white,
              size: 42.0,
            ),

          ],
        ),),

    );
  }

  Widget getCategoryButtons(double shrinkOffset) {
    return Container(
      //alignment: FractionalOffset.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10),
          shrinkOffset < 80 ? 
            Column(children: <Widget>[
              Wrap(
                spacing: 10,
                runSpacing: 2,
                children: <Widget>[
                  getRoundButton('allcat'),
                  getRoundButton('mencloth'),
                  getRoundButton('womencloth'),
                  getRoundButton('sports'),
                  getRoundButton('electronics'),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 2,
                children: <Widget>[
                getRoundButton('phone'),
                getRoundButton('computer'),
                getRoundButton('automobiles'),
                getRoundButton('jewellery'),
                getRoundButton('garden'),
              ]), ]
            
          ) : Wrap(
                spacing: 6,
                runSpacing: 10,
                children: <Widget>[
                  getRoundButton('allcat'),
                  getRoundButton('mencloth'),
                  getRoundButton('womencloth'),
                  getRoundButton('sports'),
                  getRoundButton('electronics'),
                  getRoundButton('phone'),
                  getRoundButton('computer'),
                  getRoundButton('automobiles'),
                  getRoundButton('jewellery'),
                  getRoundButton('garden'), 
                ],
            ),
          ],
        )
               
    );
  }

  Widget getRoundButton(String name) {
    return RawMaterialButton(
        constraints: BoxConstraints(maxHeight: 46),
        onPressed: () {},
        child: Image.asset('assets/images/round/$name.png'),
        shape: CircleBorder(),
        elevation: 8.0,
        fillColor: Colors.white,
        //padding: const EdgeInsets.all(0.0),
      );
  }
  
  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}