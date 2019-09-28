import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/featuredCarousel.dart';
import '../widgets/featuredCarousel.dart';

class Front extends StatelessWidget {

  final String title;
  Front(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 320.0,
              snap: true,
              floating: true,
              pinned: false,
              primary: false,
              flexibleSpace: FeaturedCarousel(),
            ),
            SliverFillRemaining(
              child: Column(
                children: <Widget>[
                  getCategoryButtons(),
                  //getTodayHotlist(),
                ],
              ) 
            ),
            
          ],
        ),
    );
  }

  Widget getRoundButton(String name) {
    return RawMaterialButton(
        constraints: BoxConstraints(maxHeight: 52),
        onPressed: () {},
        child: Image.asset('assets/images/round/$name.png'),
        shape: new CircleBorder(),
        elevation: 4.0,
        fillColor: Colors.white,
        //padding: const EdgeInsets.all(0.0),
      );
  }
  Widget getCategoryButtons() {
    return Container(
      alignment: FractionalOffset.center,
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
}

