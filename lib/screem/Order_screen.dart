import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddOrder_screen.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          var orders = snapshot.data?.docs;
          return ListView.builder(
            itemCount: orders?.length,
            itemBuilder: (context, index) {
              var order = orders?[index];
              return ListTile(
                title: Text(order?['dishName']),
                subtitle: Text('Votes: ${order?['votes']} | Note: ${order?['note']} | Quantity: ${order?['quantity']}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddOrderPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
