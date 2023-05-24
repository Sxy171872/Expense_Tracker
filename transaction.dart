import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();

enum Category { food, travel, work, leisure }

final CategoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.leisure: Icons.restaurant,
};

final formatter = DateFormat.yMd();

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Transaction({
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.category,
  }) : id = uuid.v4();

  String get FormatDate {
    return formatter.format(date);
  }
}

class transactionBucket {
  final List<Transaction> transactionsList;
  final Category category;

  transactionBucket({this.transactionsList, this.category});

  transactionBucket.forCategory(List<Transaction> allTrasaction, this.category)
      : transactionsList = allTrasaction
            .where((element) => element.category == category)
            .toList();

  double get totalSum {
    double sum = 0;

    for (var i in transactionsList) {
      sum += i.amount;
    }

    return sum;
  }
}
