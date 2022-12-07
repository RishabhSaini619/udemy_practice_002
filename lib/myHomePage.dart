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

  bool showChart = false;
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
    final mediaQuery = MediaQuery.of(context);
    final appTheme = Theme.of(context);
    final isLandscape =
        mediaQuery.orientation == Orientation.landscape;
    final appBarRow = AppBar(
      title: Text(
        'Expense Planner',
        style: appTheme.appBarTheme.titleTextStyle,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => startAddNewTx(context),
          icon: Icon(
            Icons.add_rounded,
            color: appTheme.colorScheme.secondary,
          ),
        ),
      ],
    );
    final trxList = Container(
        height: (mediaQuery.size.height -
                appBarRow.preferredSize.height) *
            0.8,
        child:
            TransactionsList(userTransactionsList, deleteSelectedTransaction));
    return Scaffold(
      appBar: appBarRow,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show Chart',
                    style: appTheme.textTheme.titleMedium,
                  ),
                  Switch(
                    activeColor: appTheme.colorScheme.secondary,
                    value: showChart,
                    onChanged: (value) {
                      setState(() {
                        showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (isLandscape)
              showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBarRow.preferredSize.height) *
                          0.7,
                      child: Chart(recentTrx),
                    )
                  : trxList,
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                    appBarRow.preferredSize.height) *
                    0.2,
                child: Chart(recentTrx),
              ),
            if (!isLandscape) trxList,
          ],
        ),
      ),
    );
  }
}
