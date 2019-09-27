import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/featuredCarousel.dart';

class Front extends StatelessWidget {

  Front(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
          children: <Widget>[
            FeaturedCarousel(),
            //CarouselWithIndicator(),
            //getCategoryButtons(context),
            //getTodayHotlist(context),
          ],
        ),
    );
  }

}

