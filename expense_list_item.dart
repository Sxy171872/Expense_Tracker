import 'dart:ffi';

import 'package:flutter/material.dart';
import './transaction.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.item);

  final Transaction item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(children: [
          Text(item.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text("\$${item.amount.toStringAsFixed(2)}"),
              const Spacer(),
              Row(
                children: [
                  Icon(CategoryIcon[item.category]),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(item.FormatDate)
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
