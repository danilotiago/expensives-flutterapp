import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  AdaptativeDatePicker({
    this.onDateChange,
    this.selectedDate,
  });

  _showDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(), // data setada
      firstDate: DateTime(2019), // data minima 1/1/2019
      lastDate: DateTime.now(), // data maxima
    ).then((pickedDate) {
      if (pickedDate != null) {
        this.onDateChange(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: this.onDateChange,
            ),
          )
        : Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Em: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
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
                  onPressed: () => _showDatePicker(context),
                )
              ],
            ),
          );
  }
}
