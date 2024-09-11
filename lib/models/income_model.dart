// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum IncomeCategory {
  Salary,
  Business_investments,
  Freelance,
  Grants,
  Scholoarships,
  Miscellaneous,
}

class Income {
  final String incomeTitle;
  final int incomeId;
  final String incomeDescription;
  final double incomeAmount;
  final IncomeCategory incomeCategory;
  final DateTime incomeDate;
  final DateTime incomeTime;

  Income(
      {required this.incomeTitle,
      required this.incomeId,
      required this.incomeDescription,
      required this.incomeAmount,
      required this.incomeCategory,
      required this.incomeDate,
      required this.incomeTime});

  //A method for convert dart object to Json Object
  Map<String, dynamic> toJSON() {
    return {
      'incomeTitle': incomeTitle,
      'incomeId': incomeId,
      'incomeDescription': incomeDescription,
      'incomeAmount': incomeAmount,
      'incomeCategory': incomeCategory.index,
      'incomeDate': incomeDate.toIso8601String(),
      'incomeTime': incomeTime.toIso8601String(),
    };
  }

  // A method to convert json object to dart object
  factory Income.fromJSON(Map<String, dynamic> json) {
    return Income(
      incomeTitle: json['incomeTitle'],
      incomeId: json['incomeId'],
      incomeDescription: json['incomeDescription'],
      incomeAmount: json['incomeAmount'],
      incomeCategory: IncomeCategory.values[json['incomeCategory']],
      incomeDate: DateTime.parse(json['incomeDate']),
      incomeTime: DateTime.parse(json['incomeTime']),
    );
  }
}

//category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.Business_investments: "assets/icons/business_investments.png",
  IncomeCategory.Freelance: "assets/icons/freelance_works.png",
  IncomeCategory.Grants: "assets/icons/grants_income.png",
  IncomeCategory.Miscellaneous: "assets/icons/miscellaneous_income.png",
  IncomeCategory.Salary: "assets/icons/salary_income.png",
  IncomeCategory.Scholoarships: "assets/icons/scholarships.png",
};

final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.Business_investments: const Color(0xFFB9ACE8),
  IncomeCategory.Freelance: const Color(0xFFB9ACE8),
  IncomeCategory.Grants: const Color(0xFFB9ACE8),
  IncomeCategory.Miscellaneous: const Color(0xFFB9ACE8),
  IncomeCategory.Salary: const Color(0xFFB9ACE8),
  IncomeCategory.Scholoarships: const Color(0xFFB9ACE8),
};
