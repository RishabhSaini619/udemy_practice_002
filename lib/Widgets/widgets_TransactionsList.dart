// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:udemy_practice_002/Model/model_Transaction.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key key}) : super(key: key);


  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactionsList.map((tx) {
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
    );
  }
}



