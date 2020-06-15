import 'package:expenses/components/adaptative_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({@required this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final String title = _titleController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isNotEmpty && value > 0 && _selectedDate != null)
      widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), // data setada
      firstDate: DateTime(2019), // data minima 1/1/2019
      lastDate: DateTime.now(), // data maxima
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Título',
              ),
              AdaptativeTextField(
                textInputType: TextInputType.numberWithOptions(decimal: true),
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                label: 'Valor (R\$)',
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Nenhuma data selecionada'
                            : 'Em: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Selecionar data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15.0),
                child: AdaptativeButton(
                  onPressed: _submitForm,
                  label: 'Salvar',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
