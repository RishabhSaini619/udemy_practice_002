import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputIdController = TextEditingController();

  final inputTitleController = TextEditingController();

  final inputAmountController = TextEditingController();

  final inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //id
            // TextField(
            //   controller: inputIdController,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     labelText: 'id',
            //     prefixIcon: Icon(
            //       Icons.perm_identity,
            //     ),
            //   ),
            //   autocorrect: true,
            //   autofocus: true,
            // ),
            //Title
            TextField(
              // onChanged: (value) {
              //   inputTitle = value;
              // },
              controller: inputTitleController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Title',
                prefixIcon: Icon(
                  Icons.abc_rounded,
                ),
              ),
              autocorrect: true,
              autofocus: true,
            ),
            //amount
            TextField(
              // onChanged: (value) {
              //   inputAmount = value;
              // },
              controller: inputAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(
                  Icons.money,
                ),
              ),
              autocorrect: true,
              autofocus: true,
            ),
            //date
            // TextField(
            //   controller: inputDateController,
            //   keyboardType: TextInputType.datetime,
            //   decoration: const InputDecoration(
            //     labelText: 'Date',
            //     prefixIcon: Icon(
            //       Icons.date_range,
            //     ),
            //   ),
            //   autocorrect: true,
            //   autofocus: true,
            // ),
            OutlinedButton(
              onPressed: () {
                if ((inputTitleController.text).isEmpty ||
                    double.parse(inputAmountController.text) <= 0) {
                  return;
                }
                widget.addNewTx(
                  inputTitleController.text,
                  double.parse(
                    inputAmountController.text,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
