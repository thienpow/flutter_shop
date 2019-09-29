import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/522786/3000/1997/m1/fpnw/wm0/flat-product-sale-mobile-banner-p1-.jpg?1434193356&s=5c40522be1701b2ce7b3c617b12fa70b',
  'https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/522794/3000/1997/m1/fpnw/wm0/flat-product-sale-shoe-banner-p1-.jpg?1434193319&s=5e32357a0be6ce6fded220d5ad54624f',
  'https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/6546124/1170/780/m1/fpnw/wm0/tropical-06-.jpg?1560625192&s=8437fcb4adf8a74950bb4d778b16d4a0'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1500.0),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              
              decoration: BoxDecoration(
                color: Colors.grey,
                gradient: LinearGradient(
                  colors: [Color.fromARGB(10, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              /*
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              */
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}


class FeaturedCarousel extends StatefulWidget {
  @override
  _FeaturedCarouselState createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CarouselSlider(
          items: child,
          autoPlay: true,
          enlargeCenterPage: true,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),

        /*
        Row( 
          // the slider dots indicator here.
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            imgList,
            (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(153, 255, 51, 0.8)
                        : Color.fromRGBO(0, 152, 51, 0.3)),
              );
            },
          ),
        ),
        */
        
      ],
      
    );
  }
}