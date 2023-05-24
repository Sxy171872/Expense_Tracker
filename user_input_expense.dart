//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction.dart';
import './transaction.dart';

class addExpense extends StatefulWidget {
  addExpense(this.callAddExpense);

  final void Function(Transaction trans) callAddExpense;
  @override
  State<addExpense> createState() => _addExpenseState();
}

class _addExpenseState extends State<addExpense> {
  @override
  // var inputTitle = '';

  // void storeTitle(String value) {
  //   inputTitle = value;
  // }

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  DateTime selectedDate;
  Category selectedCategory = Category.leisure;

  void pickDate() async {
    var todayDate = DateTime.now();
    var Firstdate =
        DateTime(todayDate.year - 1, todayDate.month, todayDate.day);

    var pickedDate = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: Firstdate,
        lastDate: todayDate);

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void saveExpense() {
    var finalAmount = double.tryParse(amountControler.text);

    var fianlTtile = titleControler.text.trim();

    if (fianlTtile == null ||
        finalAmount == null ||
        finalAmount <= 0 ||
        selectedDate == null) {
      //show error

      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Invalid Input"),
              content: Text("Checl all fields are filled correctly...."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text("Okay")),
              ],
            );
          });

      return;
    }
    Navigator.pop(context);

    widget.callAddExpense(Transaction(
        title: titleControler.text,
        amount: finalAmount,
        date: selectedDate,
        category: selectedCategory));
  }

  @override
  void dispose() {
    // TODO: implement dispose\
    amountControler.dispose();
    titleControler.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
        child: Column(
          children: [
            TextField(
              //onChanged: storeTitle,
              controller: titleControler,
              maxLength: 50,
              decoration: InputDecoration(label: Text("Title")),
            ),
            Row(children: [
              Expanded(
                child: TextField(
                  controller: amountControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("Amount")),
                ),
              ),
              SizedBox(width: 0.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null
                        ? "Not selected"
                        : formatter.format(selectedDate)),
                    IconButton(
                        onPressed: pickDate,
                        icon: Icon(Icons.calendar_month_outlined)),
                  ],
                ),
              ),
            ]),
            Row(
              children: [
                DropdownButton(
                  value: selectedCategory,
                  items: Category.values.map((element) {
                    return DropdownMenuItem(
                        value: element,
                        child: Text(element.name.toUpperCase()));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (selectedCategory == null) return;
                      selectedCategory = value;
                    });
                  },
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancle")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: saveExpense, child: Text("Save"))
              ],
            )
          ],
        ));
  }
}
