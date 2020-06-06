import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0),
              child: FlatButton(
                child: Text('Salvar'),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
