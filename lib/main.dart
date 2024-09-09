import 'package:exam20/screem/Order_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wellcome Toan'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(''),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Toan',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Restaurants'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Me'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(child: Text('Welcome to the Order Management App')),
    );
  }
}