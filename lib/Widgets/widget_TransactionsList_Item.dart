import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:udemy_practice_002/Model/model_Transaction.dart';


class TransactionsListItem extends StatelessWidget {
  const TransactionsListItem({
    Key key,
    @required this.userTransactionsListItem,
    @required this.deleteSelectedTransaction,
  }) : super(key: key);

  final Transaction userTransactionsListItem;
  final Function deleteSelectedTransaction;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appTheme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                "₹ ${userTransactionsListItem.amount}",
                style: appTheme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
        title: Text(
          " ${userTransactionsListItem.title}",
          style: appTheme.textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat().format(
            userTransactionsListItem.date,
          ),
          style: appTheme.textTheme.titleSmall,
        ),
        trailing: mediaQuery.size.width > 460
            ? TextButton.icon(
                onPressed: () =>
                    deleteSelectedTransaction(userTransactionsListItem.id),
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
                onPressed: () =>
                    deleteSelectedTransaction(userTransactionsListItem.id),
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
    //                 userTransactionsListItem
    //                     .amount
    //                     .toStringAsFixed(2),
    //                 style: appTheme.textTheme.titleLarge),
    //           ],
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(userTransactionsListItem.title,
    //               style: appTheme.textTheme.titleMedium),
    //           Text(
    //             DateFormat()
    //                 .format(userTransactionsListItem.date),
    //             style: appTheme.textTheme.titleSmall,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    // other method
  }
}
