// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum ExpenseCategory {
  Miscellaneous,
  Living_Expenses,
  Transportation,
  Food_Wellness,
  Lifestyle_Leisure,
  Education_Insurance
}

class Expense {
  final int expenseId;
  final String expenseTitle;
  final double expenseAmount;
  final ExpenseCategory expenseCategory;
  final String expenseDescription;
  final DateTime expenseDate;
  final DateTime expenseTime;

  Expense(
      {required this.expenseId,
      required this.expenseTitle,
      required this.expenseAmount,
      required this.expenseCategory,
      required this.expenseDescription,
      required this.expenseDate,
      required this.expenseTime});

  // A method to convert Dart object to Json object
  Map<String, dynamic> toJSON() {
    return {
      'expenseId': expenseId,
      'expenseTitle': expenseTitle,
      'expenseAmount': expenseAmount,
      'expenseCategory': expenseCategory.index,
      'expenseDescription': expenseDescription,
      'expenseDate': expenseDate.toIso8601String(),
      'expenseTime': expenseTime.toIso8601String(),
    };
  }

  //A method to convert Json object to Dart object
  factory Expense.fromJSON(Map<String, dynamic> json) {
    return Expense(
      expenseId: json['expenseId'],
      expenseTitle: json['expenseTitle'],
      expenseAmount: json['expenseAmount'],
      expenseCategory: ExpenseCategory.values[json['expenseCategory']],
      expenseDescription: json['expenseDescription'],
      expenseDate: DateTime.parse(json['expenseDate']),
      expenseTime: DateTime.parse(json['expenseTime']),
    );
  }
}

final Map<ExpenseCategory, String> expensecategoryImages = {
  ExpenseCategory.Education_Insurance: "assets/icons/education.png",
  ExpenseCategory.Food_Wellness: "assets/icons/food_wellness.png",
  ExpenseCategory.Lifestyle_Leisure: "assets/icons/lifestyle_leisure.png",
  ExpenseCategory.Living_Expenses: "assets/icons/living_expenses.png",
  ExpenseCategory.Miscellaneous: "assets/icons/miscellaneous.png",
  ExpenseCategory.Transportation: "assets/icons/transportation.png",
};

final Map<ExpenseCategory, Color> expensecategoryColrs = {
  ExpenseCategory.Education_Insurance: const Color(0xFFB9ACE8),
  ExpenseCategory.Food_Wellness: const Color(0xFFB9ACE8),
  ExpenseCategory.Lifestyle_Leisure: const Color(0xFFB9ACE8),
  ExpenseCategory.Living_Expenses: const Color(0xFFB9ACE8),
  ExpenseCategory.Miscellaneous: const Color(0xFFB9ACE8),
  ExpenseCategory.Transportation: const Color(0xFFB9ACE8),
};
