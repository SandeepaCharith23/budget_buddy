import 'dart:convert';

import 'package:budget_buddy/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServices {
  //key for storing Income
  static const String _incomeKey = 'incomekey';

  //A method for saving Income details to the SharedPreferences
  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      //get existing Income data from sharedPreferences objects
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String>? existingIncomeList =
          sharedPreferences.getStringList(_incomeKey);

      //convert String list in to Dart object -Income
      List<Income> existingIncomeObject = [];

      if (existingIncomeList != null) {
        existingIncomeObject = existingIncomeList
            .map((e) => Income.fromJSON(json.decode(e)))
            .toList();
      }

      //add new income to income object list
      existingIncomeObject.add(income);

      //convert this updated Income object list into String List to store in sharedPreferences
      List<String> updatedexistingIncomeStringList =
          existingIncomeObject.map((e) => json.encode(e.toJSON())).toList();

      //saved updated string list to sharedPreferences
      await sharedPreferences.setStringList(
          _incomeKey, updatedexistingIncomeStringList);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("New Income details saved successfully"),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.greenAccent,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something Errror in Adding income"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }

  //A method for loading Incomes from sharedPreferences
  Future<List<Income>> loadingIncome() async {
    //instance for shared preferences.
    SharedPreferences preferences = await SharedPreferences.getInstance();

    //get the existing Json income list with key name
    List<String>? existingJsonStringIncomeList =
        preferences.getStringList(_incomeKey);

    //convert this existing Json String IncomeList  to Income Object List
    List<Income> loadedIncomeObjectList = [];

    if (existingJsonStringIncomeList != null) {
      loadedIncomeObjectList = existingJsonStringIncomeList
          .map((e) => Income.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedIncomeObjectList;
  }

  //A method for delete selected income
  Future<void> deleteIncome(int id, BuildContext context) async {
    try {
      //get the avaiable data from shared preferences
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String>? existingIncomeStringList =
          sharedPreferences.getStringList(_incomeKey);

      //Convert the existing String List to Dart objects
      List<Income> existingIncomeObjects = [];

      if (existingIncomeStringList != null) {
        existingIncomeObjects = existingIncomeStringList
            .map((source) => Income.fromJSON(json.decode(source)))
            .toList();
      }

      //remove the selected value from json object
      existingIncomeObjects.removeWhere((income) => income.incomeId == id);

      //convert again this dart object to list<string>
      List<String> updatedIncomeStringLists = existingIncomeObjects
          .map((source) => json.encode(source.toJSON()))
          .toList();

      //Saved updated String list to shared Preferences
      await sharedPreferences.setStringList(
          _incomeKey, updatedIncomeStringLists);

      //display a scaffoldmessenger
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Successfully removed selected expense"),
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
