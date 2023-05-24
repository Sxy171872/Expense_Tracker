import 'package:flutter/material.dart';
import './expenses_list.dart';
import './transaction.dart';
import './user_input_expense.dart';
import './chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  final List<Transaction> transactions = [
    Transaction(
        category: Category.food,
        amount: 100.00,
        date: DateTime.now(),
        title: "Lunch"),
    Transaction(
        category: Category.travel,
        amount: 150.00,
        date: DateTime.now(),
        title: "Abc vfd"),
    Transaction(
        category: Category.leisure,
        amount: 10.00,
        date: DateTime.now(),
        title: "Diner"),
  ];

  void _showAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return addExpense(addExpensetoList);
        });
  }

  void addExpensetoList(Transaction tras) {
    setState(() {
      transactions.add(tras);
    });
  }

  void removeExpense(Transaction tras) {
    var idx = transactions.indexOf(tras);
    setState(() {
      transactions.remove(tras);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Item deleted..."),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            transactions.insert(idx, tras);
          });
        },
      ),
    ));
  }

  Widget build(BuildContext context) {
    Widget listToshow = Center(
      child: Text("No expenses found. Try to add some ..."),
    );

    if (transactions.isNotEmpty) {
      listToshow = ExpenseList(
        Trasaction_list: transactions,
        removeexpenceCall: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _showAddExpense, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Chart(transactions), Expanded(child: listToshow)],
      ),
    );
  }
}
