// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:udemy_practice_002/Model/model_Transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactionsList;
  TransactionsList(this.userTransactionsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
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
                       Text(
                        "₹",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      Text(
                        userTransactionsList[index].amount.toStringAsFixed(2),
                        style:  TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userTransactionsList[index].title,
                      style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    Text(
                      DateFormat().format(userTransactionsList[index].date),
                      style:  TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: userTransactionsList.length,
      ),
    );
  }
}
