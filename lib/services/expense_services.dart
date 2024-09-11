import 'dart:convert';

import 'package:budget_buddy/models/expense_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseServices {
//1.List of Expense
  // final List<Expense> _expenseList = [];

//2.create a key for get values
  static const String _expenseKey = 'expenses';
//3.A method for save expense
  Future<void> saveExpenses(Expense expense, BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      List<String>? existingExpenses = preferences.getStringList(_expenseKey);

      //1.convert the existing expenses to a List of Expense Objects
      List<Expense> existingExpenseObjects = [];

      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => Expense.fromJSON(json.decode(e)))
            .toList();
      }

      //2.Add the new expenses to the List
      existingExpenseObjects.add(expense);

      //3.convert the list of expense objects back to list of strings
      List<String> updatedExpenses =
          existingExpenseObjects.map((e) => json.encode(e.toJSON())).toList();

      //4.Save the updated list of expenses to shared preferences
      await preferences.setStringList(_expenseKey, updatedExpenses);

      //5.show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Expenses added successfully"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.greenAccent,
        ));
      }
    } catch (error) {
      //5.show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something Error occured"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }

//4.A method for load Expenses from sharedpreferences
  Future<List<Expense>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenseKey);

    //convert existing expenses to a list of Expense object
    List<Expense> loadedExpenses = [];

    //Map existingExpenses in to Expense Object
    if (existingExpenses != null) {
      loadedExpenses = existingExpenses
          .map((e) => Expense.fromJSON(json.decode(e)))
          .toList();
    }

    //return loadedExpense
    return loadedExpenses;
  }

  //A method for deleting expense form sharedPreference
  Future<void> deleteExpense(int id, BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String>? existingExpensesStringList =
          sharedPreferences.getStringList(_expenseKey);

      //convert into json object
      List<Expense> existingExpenseObjects = [];

      if (existingExpensesStringList != null) {
        existingExpenseObjects = existingExpensesStringList
            .map((e) => Expense.fromJSON(json.decode(e)))
            .toList();
      }

      //remove selected value from json object list
      existingExpenseObjects.removeWhere((expense) => expense.expenseId == id);

      //convert again to json List of Strings
      List<String> updatedExpensesStringLists =
          existingExpenseObjects.map((e) => json.encode(e.toJSON())).toList();

      //save updated String List of expenses to shared preferences
      await sharedPreferences.setStringList(
          _expenseKey, updatedExpensesStringLists);

      //display a success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Successfully Removed expense"),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      //display a success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something error"),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
