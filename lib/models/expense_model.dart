import 'package:flutter/material.dart';

enum ExpenseCategory {
  housing,
  transportation,
  foods,
  healthandWellness,
  entertainmentandRecreation,
  education,
  personalAndFamilyCare,
  insurance,
  giftsandDonations,
  miscellaneous,
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
  ExpenseCategory.education: "assets/icons/expense_icon.png",
  ExpenseCategory.entertainmentandRecreation: "assets/icons/expense_icon.png",
  ExpenseCategory.foods: "assets/icons/expense_icon.png",
  ExpenseCategory.giftsandDonations: "assets/icons/expense_icon.png",
  ExpenseCategory.healthandWellness: "assets/icons/expense_icon.png",
  ExpenseCategory.housing: "assets/icons/expense_icon.png",
  ExpenseCategory.insurance: "assets/icons/expense_icon.png",
  ExpenseCategory.miscellaneous: "assets/icons/expense_icon.png",
  ExpenseCategory.personalAndFamilyCare: "assets/icons/expense_icon.png",
  ExpenseCategory.transportation: "assets/icons/expense_icon.png",
};

final Map<ExpenseCategory, Color> expensecategoryColrs = {
  ExpenseCategory.education: const Color(0xFFB9ACE8),
  ExpenseCategory.entertainmentandRecreation: const Color(0xFF000000),
  ExpenseCategory.foods: const Color(0xFF000000),
  ExpenseCategory.giftsandDonations: const Color(0xFF000000),
  ExpenseCategory.healthandWellness: const Color(0xFF000000),
  ExpenseCategory.housing: const Color(0xFF000000),
  ExpenseCategory.insurance: const Color(0xFF000000),
  ExpenseCategory.miscellaneous: const Color(0xFF000000),
  ExpenseCategory.personalAndFamilyCare: const Color(0xFF000000),
  ExpenseCategory.transportation: const Color(0xFF000000),
};
