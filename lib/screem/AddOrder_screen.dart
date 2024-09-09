import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOrderPage extends StatefulWidget {
  @override
  _AddOrderPageState createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _formKey = GlobalKey<FormState>();
  String dishName = '';
  int votes = 0;
  String note = '';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Order')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Dish Name'),
                onSaved: (value) => dishName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Votes'),
                keyboardType: TextInputType.number,
                onSaved: (value) => votes = int.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Note'),
                onSaved: (value) => note = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onSaved: (value) => quantity = int.parse(value!),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    FirebaseFirestore.instance.collection('orders').add({
                      'dishName': dishName,
                      'votes': votes,
                      'note': note,
                      'quantity': quantity,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Order'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
