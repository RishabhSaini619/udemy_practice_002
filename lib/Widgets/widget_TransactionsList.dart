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
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  elevation: 10,
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
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
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
              },
              itemCount: userTransactionsList.length,
            ),
    );
  }
}
