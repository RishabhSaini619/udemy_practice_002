import 'dart:math';

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:udemy_practice_002/Model/model_Transaction.dart';


class TransactionsListItem extends StatefulWidget {
  const TransactionsListItem({
    Key key,
    @required this.userTransactionsListItem,
    @required this.deleteSelectedTransaction,
  }) : super(key: key);

  final Transaction userTransactionsListItem;
  final Function deleteSelectedTransaction;

  @override
  State<TransactionsListItem> createState() => _TransactionsListItemState();
}

class _TransactionsListItemState extends State<TransactionsListItem> {
  Color bgColors ;
  @override
  void initState() {
    const availableColors = [
      Colors.deepOrange,
      Colors.amberAccent,
      Colors.grey,
      Colors.black,
      Colors.blueAccent,
    ];
    bgColors = availableColors[Random().nextInt(5)];
    super.initState();
  }
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
          decoration:  BoxDecoration(
            //color: Colors.amberAccent,
            color: bgColors,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                "₹ ${widget.userTransactionsListItem.amount}",
                style: appTheme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
        title: Text(
          " ${widget.userTransactionsListItem.title}",
          style: appTheme.textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat().format(
            widget.userTransactionsListItem.date,
          ),
          style: appTheme.textTheme.titleSmall,
        ),
        trailing: mediaQuery.size.width > 460
            ? TextButton.icon(
                onPressed: () =>
                    widget.deleteSelectedTransaction(widget.userTransactionsListItem.id),
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
                    widget.deleteSelectedTransaction(widget.userTransactionsListItem.id),
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
