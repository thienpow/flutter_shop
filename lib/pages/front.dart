import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/featuredCarousel.dart';

class Front extends StatelessWidget {

  final String title;
  Front(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Column(
          
          children: <Widget>[
            FeaturedCarousel(),
            getCategoryButtons(),
            //getTodayHotlist(context),
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
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 1, child: Container(),),
                  getRoundButton('allcat'),
                  SizedBox(width: 10),
                  getRoundButton('mencloth'),
                  SizedBox(width: 10),
                  getRoundButton('womencloth'),
                  SizedBox(width: 10),
                  getRoundButton('sports'),
                  SizedBox(width: 10),
                  getRoundButton('electronics'),
                  Expanded(flex: 1, child: Container(),),
                ]
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 1, child: Container(),),
                  getRoundButton('phone'),
                  SizedBox(width: 10),
                  getRoundButton('computer'),
                  SizedBox(width: 10),
                  getRoundButton('automobiles'),
                  SizedBox(width: 10),
                  getRoundButton('jewellery'),
                  SizedBox(width: 10),
                  getRoundButton('garden'),
                  Expanded(flex: 1, child: Container(),),
              ],)
            ]
          ),
        );
  }
}

