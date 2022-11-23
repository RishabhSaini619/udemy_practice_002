import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Model/model_Transaction.dart';
import 'package:udemy_practice_002/Widgets/widget_NewTransaction.dart';
import 'package:udemy_practice_002/Widgets/widgets_TransactionsList.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> userTransactionsList = [
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

  void addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      userTransactionsList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction),
        TransactionsList(userTransactionsList),
      ],
    );
  }
}
