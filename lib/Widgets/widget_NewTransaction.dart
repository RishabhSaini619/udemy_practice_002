import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);
  final inputIdController = TextEditingController();
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  final inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: inputIdController,
                decoration: InputDecoration(
                  labelText: 'id',
                  prefixIcon: Icon(
                    Icons.perm_identity,
                  ),
                ),
                autocorrect: true,
                autofocus: true,
              ),
              TextField(
                // onChanged: (value) {
                //   inputTitle = value;
                // },
                controller: inputTitleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  prefixIcon: Icon(
                    Icons.abc_rounded,
                  ),
                ),
                autocorrect: true,
                autofocus: true,
              ),
              TextField(
                // onChanged: (value) {
                //   inputAmount = value;
                // },
                controller: inputAmountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixIcon: Icon(
                    Icons.money,
                  ),
                ),
                autocorrect: true,
                autofocus: true,
              ),
              TextField(
                controller: inputDateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  prefixIcon: Icon(
                    Icons.date_range,
                  ),
                ),
                autocorrect: true,
                autofocus: true,
              ),
              TextButton(
                onPressed: () {
                  // print('Input Title: $inputTitle \n Input Amount : ₹$inputAmount');
                  print('Input id: $inputIdController');
                  print('Input Title: $inputTitleController');
                  print('Input Amount: $inputAmountController');
                  print('Input Date: $inputDateController');
                  addNewTx(
                    inputTitleController.text,
                    double.parse(inputAmountController.text),
                  );
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
