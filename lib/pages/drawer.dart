
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: Colors.white,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Flutter Sample'),
            ),
            ListTile(
              title: Text('Cart'),
              
            ),
            ListTile(
              title: Text('Messages'),
              
            ),
            ListTile(
              title: Text('Order History'),
              
            ),
            ListTile(
              title: Text('Wish List'),
              
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
    );
    
  }

}
