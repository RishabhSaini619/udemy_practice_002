// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Model/model_Transaction.dart';
import 'package:udemy_practice_002/Widgets/widget_TransactionsList_Item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactionsList;
  Function deleteSelectedTransaction;
  TransactionsList(this.userTransactionsList, this.deleteSelectedTransaction,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return userTransactionsList.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: appTheme.primaryColor,
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.85,
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Image.asset(
                    "assets/image/waiting.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionsListItem(
                userTransactionsListItem: userTransactionsList[index],
                deleteSelectedTransaction: deleteSelectedTransaction,
              );
            },
            itemCount: userTransactionsList.length,
          );
  }
}
