import 'package:flutter/material.dart';

class ViewBills {
  final String billName;
  final String date;
  final String amount;
  final String description;
  final IconData icon;

  ViewBills({
    required this.billName,
    required this.date,
    required this.amount,
    required this.icon,
    required this.description,
  });

  String get formattedAmount => '\$$amount';
}
