import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amoutController = TextEditingController();

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amoutController.text);
    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    widget.addTx(titleController.text, double.parse(amoutController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Title",
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder()),
                  controller: titleController,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Amount",
                      prefixIcon: Icon(Icons.add_card_outlined),
                      border: OutlineInputBorder()),
                  controller: amoutController,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => submitData,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: submitData,
                child: const Text('Add Transaction'),
              )
            ],
          )),
    );
  }
}
