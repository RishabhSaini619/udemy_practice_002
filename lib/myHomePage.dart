import 'package:flutter/material.dart';
import './Model/model_Transaction.dart';
import './Widgets/widget_Chart.dart';
import './Widgets/widget_NewTransaction.dart';
import './Widgets/widget_TransactionsList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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

  List<Widget> buildLandscapeContent(
    MediaQueryData mediaQuery,
    AppBar appBarRow,
    Widget trxListWidget,
  ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).colorScheme.secondary,
            value: showChart,
            onChanged: (value) {
              setState(() {
                showChart = value;
              });
            },
          ),
        ],
      ),
      showChart
          ? SizedBox(
              height:
                  (mediaQuery.size.height - appBarRow.preferredSize.height) *
                      0.7,
              child: Chart(recentTrx),
            )
          : trxListWidget,
    ];
  }

  List<Widget> buildPortraitContent(
    MediaQueryData mediaQuery,
    AppBar appBarRow,
    Widget trxListWidget,
  ) {
    return [
      SizedBox(
        height: (mediaQuery.size.height - appBarRow.preferredSize.height) * 0.2,
        child: Chart(recentTrx),
      ),
      trxListWidget,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appTheme = Theme.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
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
    final trxList = SizedBox(
      height: (mediaQuery.size.height - appBarRow.preferredSize.height) * 0.8,
      child: TransactionsList(
        userTransactionsList,
        deleteSelectedTransaction,
      ),
    );
    return Scaffold(
      appBar: appBarRow,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isPortrait)
              ...buildPortraitContent(
                mediaQuery,
                appBarRow,
                trxList,
              ),
            if (isLandscape)
              ...buildLandscapeContent(
                mediaQuery,
                appBarRow,
                trxList,
              ),
          ],
        ),
      ),
    );
  }
}
