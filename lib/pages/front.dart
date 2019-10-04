import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/bottomWave.dart';
import 'package:flutter_shop/widgets/featuredCarousel.dart';
import 'package:flutter_shop/widgets/searchAppBar.dart';
import '../widgets/featuredCarousel.dart';

import 'package:english_words/english_words.dart' as words;

import 'addToCart.dart';


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
  

  void moveTo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddToCartScreen(),
      ),
    );
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      //backgroundColor: Colors.transparent,
      body: CustomScrollView(
        
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(218, this),
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
    listItems.add(SizedBox(height: 200,));
    listItems.add(getTodayHotList(context));

    return listItems;
  }

  Widget getTodayHotList(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      alignment: Alignment.topCenter,
      width: width,
      padding: EdgeInsets.fromLTRB(width * .01, 0, width *.01, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            direction: Axis.vertical,
            spacing: 2.0,
            runSpacing: 20.0,

            children: <Widget>[
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),
              getProductCard(context, "Flut Shoe", "\$800-\$1000", "https://res.cloudinary.com/thienpow/image/upload/v1570110107/samples/ecommerce/shoes.png"),
              getProductCard(context, "Mi Mix Alpha", "\$2200-\$2500", "https://res.cloudinary.com/thienpow/image/upload/v1570111532/samples/ecommerce/MiMixAlpha_qbgqxc.png"),
              
              getProductCard(context, "Huawei Mate 30", "\$1200-\$1500", "https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/pdp/phones/huawei-mate30-4g/images/tl/overview/intro/mate30-4g-pic-kv-phoneback-green.png"),
              getProductCard(context, "Huawei P30 Pro", "\$1000-\$1200", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "VIVO NEX 3", "\$800-\$1100", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpropakistani.pk%2Fprice%2Fwp-content%2Fuploads%2F2018%2F06%2Fvivo-nex-s2-1-1.jpg&f=1&nofb=1"),

              getProductCard(context, "Huawei P30 Pro", "\$1200-\$1500", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              getProductCard(context, "NEX 3 5G", "\$1200-\$1500", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpocketnow.com%2Fwp-content%2Fuploads%2F2019%2F09%2F0079Fyh9ly1g6n8wce3s1j30u01hcqe5.jpg&f=1&nofb=1"),
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),

            ],
          ), 
          Wrap(
            direction: Axis.vertical,
            spacing: 2.0,
            runSpacing: 20.0,
            children: <Widget>[              
              getProductCard(context, "Mi Mix Alpha", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111532/samples/ecommerce/MiMixAlpha_qbgqxc.png"),
              getProductCard(context, "Flut Analog Classic", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570110104/samples/ecommerce/analog-classic.jpg"),
              getProductCard(context, "Huawei Mate 30", "\$1200-\$1500", "https://www.notebookcheck.com/fileadmin/Notebooks/News/_nc3/Huawei_Mate_30_Glas_Unibody_NBClogo_2.jpg"),
              
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),
              getProductCard(context, "NEX 3 5G", "\$1200-\$1500", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpocketnow.com%2Fwp-content%2Fuploads%2F2019%2F09%2F0079Fyh9ly1g6n8wce3s1j30u01hcqe5.jpg&f=1&nofb=1"),
              getProductCard(context, "Huawei P30 Pro", "\$1200-\$1500", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              
              getProductCard(context, "Mi Mix Alpha", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111532/samples/ecommerce/MiMixAlpha_qbgqxc.png"),
              getProductCard(context, "Apple iPhone 11", "\$1200-\$1500", "https://res.cloudinary.com/thienpow/image/upload/v1570111530/samples/ecommerce/iphone11_itimyz.png"),
              getProductCard(context, "Huawei P30 Pro", "\$1200-\$1500", "https://assets.mspimages.in/wp-content/uploads/2018/12/Huawei-P30-Pro-Aurora.png"),
              
            ],
          ), 
        ],
      ), 
    );
  }

  Widget getProductCard(BuildContext context, String name, String price, String url) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [BoxShadow(
            color: Colors.transparent,
            blurRadius: 8.0,
          ),]
      ),
      width: width * .49,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: FractionalOffset.center,
      child: Card(
        child: InkWell(
          splashColor: Colors.pink.withAlpha(30),
          onTap: () {
            print('Card tapped.');
            //TODO: addToCart
            moveTo();
          },
          child: Container(
            child: Column(children: <Widget>[
              ConstrainedBox(
                constraints: new BoxConstraints(
                  maxHeight: 300.0, //here limit the height of image to 300 for better viewing pleasure.
                ),
                child: Image.network(url, fit: BoxFit.cover),
              ),
              Container(
                width: width * .45,
                padding: EdgeInsets.fromLTRB(6.0, 12.0, 1.0, 3.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      Text('$name'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      //TODO: add description param and pass in the text widget below.
                      Text('Descriptions here for $name', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal, fontSize: 12)),
                      SizedBox(height: 3,),
                      Text('$price'.toUpperCase(), style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 3,),
                    ]
                  ),
                ),
              ),
            ],) 
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
        constraints: BoxConstraints(maxHeight: 46),
        onPressed: () {},
        child: Image.asset('assets/images/round/$name.png'),
        shape: CircleBorder(),
        elevation: 8.0,
        fillColor: Colors.white,
        //padding: const EdgeInsets.all(0.0),
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

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [

        // ********* curve Background ************
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
              //height: MediaQuery.of(context).size.height * 0.1,

              // ********* Search Button ************
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget>[
                  AppBar(
                    primary: true,
                    title: parent.getDummySearchButton(),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
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

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}