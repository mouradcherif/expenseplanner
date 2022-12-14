import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onFieldSubmitted: (_) => submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextButton(
                child: Text('Add Transaction'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: () {
                  submitData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
