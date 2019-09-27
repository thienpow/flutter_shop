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
            //CarouselWithIndicator(),
            //getCategoryButtons(context),
            //getTodayHotlist(context),
          ],
        ),
    );
  }

}

