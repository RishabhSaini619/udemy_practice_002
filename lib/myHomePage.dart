import 'package:flutter/material.dart';
import 'package:udemy_practice_002/Model/model_Transaction.dart';
import 'package:udemy_practice_002/Widgets/widget_NewTransaction.dart';
import 'package:udemy_practice_002/Widgets/widgets_TransactionsList.dart';

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
  ];

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
          children: [
            Card(
              color: Theme.of(context).primaryColor,
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                child: Text(
                  'Chart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
            TransactionsList(userTransactionsList),
          ],
        ),
      ),
    );
  }
}
