// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:udemy_practice_002/Model/model_Transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactionsList;
  Function deleteSelectedTransaction;
  TransactionsList(this.userTransactionsList, this.deleteSelectedTransaction,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appTheme = Theme.of(context);
    return userTransactionsList.isEmpty
        ? LayoutBuilder(builder: (Context, constraints) {
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
                    decoration: const BoxDecoration(
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
                          style: appTheme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    " ${userTransactionsList[index].title}",
                    style: appTheme.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat().format(
                      userTransactionsList[index].date,
                    ),
                    style: appTheme.textTheme.titleSmall,
                  ),
                  trailing: mediaQuery.size.width > 460
                      ? TextButton.icon(

                    onPressed: () => deleteSelectedTransaction(
                        userTransactionsList[index].id),
                          icon: Icon(
                            Icons.delete_forever_rounded,
                            color: appTheme.errorColor,
                          ),
                          label: Text(
                            'Delete',
                            style: appTheme.textTheme.titleSmall,
                          ),
                        )
                      : IconButton(
                          onPressed: () => deleteSelectedTransaction(
                              userTransactionsList[index].id),
                          icon: Icon(
                            Icons.delete_forever_rounded,
                            color: appTheme.errorColor,
                          ),
                        ),
                ),
              );
              // return Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //           shape: BoxShape.rectangle,
              //           border: Border.all(
              //             color: appTheme.primaryColor,
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
              //                 style: appTheme.textTheme.titleMedium),
              //             Text(
              //                 userTransactionsList[index]
              //                     .amount
              //                     .toStringAsFixed(2),
              //                 style: appTheme.textTheme.titleLarge),
              //           ],
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(userTransactionsList[index].title,
              //               style: appTheme.textTheme.titleMedium),
              //           Text(
              //             DateFormat()
              //                 .format(userTransactionsList[index].date),
              //             style: appTheme.textTheme.titleSmall,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
              // other method
            },
            itemCount: userTransactionsList.length,
          );
  }
}
