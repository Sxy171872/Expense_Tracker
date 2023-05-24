import 'package:flutter/material.dart';
import './expense_list_item.dart';
import './transaction.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {@required this.Trasaction_list, @required this.removeexpenceCall});

  final List<Transaction> Trasaction_list;

  final void Function(Transaction trans) removeexpenceCall;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Trasaction_list.length,
        itemBuilder: (context, index) => Dismissible(
            background: Container(
              color: Color.fromARGB(255, 203, 149, 245),
              margin: Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (direction) {
              removeexpenceCall(Trasaction_list[index]);
            },
            key: ValueKey(Trasaction_list[index]),
            child: ExpenseItem(Trasaction_list[index])));
  }
}
