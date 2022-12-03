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
      height: 740,
      child: userTransactionsList.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/image/waiting.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             style: BorderStyle.solid,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(5),
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 10,
                //         ),
                //         child: Row(
                //           children: [
                //             Text("₹",
                //                 style: Theme.of(context).textTheme.titleMedium),
                //             Text(
                //                 userTransactionsList[index]
                //                     .amount
                //                     .toStringAsFixed(2),
                //                 style: Theme.of(context).textTheme.titleLarge),
                //           ],
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(userTransactionsList[index].title,
                //               style: Theme.of(context).textTheme.titleMedium),
                //           Text(
                //             DateFormat()
                //                 .format(userTransactionsList[index].date),
                //             style: Theme.of(context).textTheme.titleSmall,
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      radius: 45,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: FittedBox(
                          child: Text(
                            "₹ ${userTransactionsList[index].amount}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      " ${userTransactionsList[index].title}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat().format(
                        userTransactionsList[index].date,
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    // trailing: ,
                  ),
                );
              },
              itemCount: userTransactionsList.length,
            ),
    );
  }
}
