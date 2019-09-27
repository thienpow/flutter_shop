import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Snap extends StatelessWidget {

  Snap(this.listType);
  final String listType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              listType,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}