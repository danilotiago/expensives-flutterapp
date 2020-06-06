import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({@required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0),
              child: FlatButton(
                child: Text('Salvar'),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: () {
                  final String title = _titleController.text;
                  final double value =
                      double.tryParse(_valueController.text) ?? 0.0;

                  onSubmit(title, value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
