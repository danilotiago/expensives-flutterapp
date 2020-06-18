import 'package:expenses/components/transactionItem.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String id) onRemove;

  TransactionList({this.transactions, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: this.transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                print(constraints.maxHeight);
                return Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Nenhuma transação cadastrada',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionItem(
                  transaction: transaction,
                  onRemove: onRemove,
                );
              },
            ),
    );
  }
}
