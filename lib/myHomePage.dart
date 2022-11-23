import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Widgets/widgets_TransactionsList.dart';

class MyHomePage extends StatelessWidget {
  // String inputTitle;
  // String inputAmount;

  final inputIdController = TextEditingController();
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  final inputDateController = TextEditingController();


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
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: inputIdController,
                    decoration: InputDecoration(
                      labelText: 'id',
                      prefixIcon: Icon(
                        Icons.perm_identity,
                      ),
                    ),
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextField(
                    // onChanged: (value) {
                    //   inputTitle = value;
                    // },
                    controller: inputTitleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      prefixIcon: Icon(
                        Icons.abc_rounded,
                      ),
                    ),
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextField(
                    // onChanged: (value) {
                    //   inputAmount = value;
                    // },
                    controller: inputAmountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      prefixIcon: Icon(
                        Icons.money,
                      ),
                    ),
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextField(
                    controller: inputDateController,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      prefixIcon: Icon(
                        Icons.date_range,
                      ),
                    ),
                    autocorrect: true,
                    autofocus: true,
                  ),
                  TextButton(
                    onPressed: () {
                      // print('Input Title: $inputTitle \n Input Amount : ₹$inputAmount');
                      print('Input id: $inputIdController');
                      print('Input Title: $inputTitleController');
                      print('Input Amount: $inputAmountController');
                      print('Input Date: $inputDateController');
                    },
                    child: const Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          ),
          TransactionsList(),
        ],
      ),
    );
  }
}
