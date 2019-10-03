import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.3NZRyLiNJlHoShVhGO_31QHaDx%26pid%3DApi&f=1',
  'https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/522794/3000/1997/m1/fpnw/wm0/flat-product-sale-shoe-banner-p1-.jpg?1434193319&s=5e32357a0be6ce6fded220d5ad54624f',
  'https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/6546124/1170/780/m1/fpnw/wm0/tropical-06-.jpg?1560625192&s=8437fcb4adf8a74950bb4d778b16d4a0'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Image.network(i, fit: BoxFit.cover, width: 1500,),
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
  @override
  Widget build(BuildContext context) {
    return 
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: CarouselSlider(
                        items: child,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        onPageChanged: (index) {
                          //TODO: push to the featured page.
                        },
                  ),
                ),);
    
  }
}