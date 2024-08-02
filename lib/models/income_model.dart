import 'package:flutter/material.dart';

enum IncomeCategory {
  salary,
  wages,
  business,
  freelance,
  investments,
  rentals,
  pensions,
  befits,
  grants,
  scholoarships,
  miscellaneous,
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
}

//category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.befits: "assets/icons/income_icon.png",
  IncomeCategory.salary: "assets/icons/income_icon.png",
  IncomeCategory.business: "assets/icons/income_icon.png",
  IncomeCategory.freelance: "assets/icons/income_icon.png",
  IncomeCategory.grants: "assets/icons/income_icon.png",
  IncomeCategory.investments: "assets/icons/income_icon.png",
  IncomeCategory.miscellaneous: "assets/icons/income_icon.png",
  IncomeCategory.pensions: "assets/icons/income_icon.png",
  IncomeCategory.rentals: "assets/icons/income_icon.png",
  IncomeCategory.scholoarships: "assets/icons/income_icon.png",
  IncomeCategory.wages: "assets/icons/income_icon.png",
};

final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.befits: const Color(0xFFE57373),
  IncomeCategory.salary: const Color(0xFF8E2828),
  IncomeCategory.business: const Color(0xFF73E5B7),
  IncomeCategory.freelance: const Color(0xFF741F1F),
  IncomeCategory.grants: const Color(0xFFE5B573),
  IncomeCategory.investments: const Color(0xFFBFEC09),
  IncomeCategory.miscellaneous: const Color(0xFF035E36),
  IncomeCategory.pensions: const Color(0xFF45ACE7),
  IncomeCategory.rentals: const Color(0xFF431081),
  IncomeCategory.scholoarships: const Color(0xFFE573DB),
  IncomeCategory.wages: const Color(0xFF120320),
};
