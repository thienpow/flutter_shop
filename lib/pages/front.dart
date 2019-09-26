import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Front extends StatelessWidget {

  Front(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
          children: <Widget>[
            //getFeaturedSlider(context),
            //getCategoryButtons(context),
            //getTodayHotlist(context),
          ],
        ),
    );
  }

}