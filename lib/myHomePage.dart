import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Widgets/widgets_UserTransaction.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.blue,
            elevation: 5,
            child: Container(
              width: double.infinity,
              child: const Text(
                'Chart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}
