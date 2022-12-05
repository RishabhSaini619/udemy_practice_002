import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime selectedDate;

  void submitData() {
    if (inputAmountController.text.isEmpty) {
      return;
    }
    final enteredTitle = inputTitleController.text;
    final enteredAmount = double.parse(inputAmountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addNewTx(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void trxDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date",
                  style: Theme.of(context).textTheme.titleMedium,),

                Text(
                  selectedDate == null
                      ? 'No Date Chosen'
                      : DateFormat.yMd().format(selectedDate),
                  style: Theme.of(context).textTheme.titleSmall,

                ),
                IconButton(
                  onPressed: trxDatePicker,
                  icon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: submitData,
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
