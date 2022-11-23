import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Widgets/widgets_UserTransaction.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner',textAlign: TextAlign.center,),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.add_rounded),),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.deepPurple,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                child: const Text(
                  'Chart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
