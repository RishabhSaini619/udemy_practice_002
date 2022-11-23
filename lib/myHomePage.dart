// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:udemy_practice_002/transaction.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {

  // String inputTitle;
  // String inputAmount;

  final inputIdController = TextEditingController();
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  final inputDateController = TextEditingController();

  final List<Transaction> transactions = [
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
                    decoration:  InputDecoration(
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
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "₹",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.redAccent,
                            ),
                          ),
                          Text(
                            tx.amount.toString(),
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          DateFormat().format(tx.date),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
