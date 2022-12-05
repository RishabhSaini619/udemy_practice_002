import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Model/model_Transaction.dart';
import 'package:udemy_practice_002/Widgets/widget_Chart.dart';
import 'package:udemy_practice_002/Widgets/widget_NewTransaction.dart';
import 'package:udemy_practice_002/Widgets/widget_TransactionsList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactionsList = [];

  List<Transaction> get recentTrx {
    return userTransactionsList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );
    setState(() {
      userTransactionsList.add(newTx);
    });
  }

  void deleteSelectedTransaction(String id) {
    setState(() {
      userTransactionsList.removeWhere((trx) {
        return trx.id == id;
      });
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
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTrx),
            TransactionsList(userTransactionsList, deleteSelectedTransaction),
          ],
        ),
      ),
    );
  }
}
