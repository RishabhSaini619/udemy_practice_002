import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Model/model_Transaction.dart';
import 'package:udemy_practice_002/Widgets/widget_Chart.dart';
import 'package:udemy_practice_002/Widgets/widget_NewTransaction.dart';
import 'package:udemy_practice_002/Widgets/widget_TransactionsList.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    Transaction(
      id: 't3',
      title: 'New Shoes',
      amount: 699.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't4',
      title: 'New Buds',
      amount: 1699.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),Transaction(
      id: 't5',
      title: 'New Shoes',
      amount: 699.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't6',
      title: 'New Buds',
      amount: 1699.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't7',
      title: 'New Shoes',
      amount: 699.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't8',
      title: 'New Buds',
      amount: 1699.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't9',
      title: 'New Shoes',
      amount: 699.99,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't10',
      title: 'New Buds',
      amount: 1699.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),

  ];

  List<Transaction> get recentTrx {
    return userTransactionsList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void startAddNewTx(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (builderCtx) {
        return NewTransaction(addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).accentColorBrightness,
      appBar: AppBar(
        title: Text(
          'Expense Planner',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => startAddNewTx(context),
            icon: Icon(
              Icons.add_rounded,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Chart(recentTrx),

            TransactionsList(userTransactionsList),
          ],
        ),
      ),
    );
  }
}
