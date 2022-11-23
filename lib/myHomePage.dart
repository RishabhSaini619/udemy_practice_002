import 'package:flutter/material.dart';
import 'package:udemy_practice_002/transaction.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> transacions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 699.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Buds',
      amount: 1699.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              child: Text(
                'Chart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            elevation: 5,
            //
          ),
          Card(
            color: Colors.amberAccent,
            child: Text('List of Transaction'),
          ),
        ],
      ),
    );
  }
}
