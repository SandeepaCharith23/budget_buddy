import 'package:budget_buddy/models/expense_model.dart';
import 'package:budget_buddy/models/income_model.dart';
import 'package:budget_buddy/services/expense_services.dart';
import 'package:budget_buddy/services/income_services.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/widgets/custom_button01.dart';
import 'package:budget_buddy/widgets/custom_button02.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AddnewScreen extends StatefulWidget {
  final Function(Expense) addExpense;
  final Function(Income) addIncome;
  const AddnewScreen(
      {super.key, required this.addExpense, required this.addIncome});

  @override
  State<AddnewScreen> createState() => _AddnewScreenState();
}

class _AddnewScreenState extends State<AddnewScreen> {
  //track the selected item-Expense or Category
  int _selecteditem = 0;

  //A variable for saved selected category
  ExpenseCategory expenseCategory =
      ExpenseCategory.miscellaneous; //default value;
  IncomeCategory incomeCategory = IncomeCategory.miscellaneous;

  //TextEditing Controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  //Variable for selecting Date and Time
  DateTime selectedDate = DateTime.now();
  DateTime selecteTime = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selecteditem == 0 ? kMainColor : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                //expense and Income selection button row
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Expense button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selecteditem = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selecteditem == 0
                                    ? kMainLightColor
                                    : kWhite,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 10),
                                child: Text(
                                  "Expense",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _selecteditem == 0 ? kWhite : kGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //income button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selecteditem = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _selecteditem == 1 ? kGreen : kWhite,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 10),
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _selecteditem == 1
                                        ? kWhite
                                        : kMainColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Expense or Income Total display section
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selecteditem == 0
                            ? "Expense Amount "
                            : "Income Amount",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextField(
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kWhite,
                        ),
                        decoration: InputDecoration(
                          hintText: "Rs 0.00",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ),

                      //Expense or Income details section
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.015),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: const BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Form(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //category selector dropdown
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                  ),
                                  items: _selecteditem == 0
                                      ? ExpenseCategory.values.map((category) {
                                          return DropdownMenuItem(
                                            value: category,
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Text(
                                              category.name,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          );
                                        }).toList()
                                      : IncomeCategory.values.map((category) {
                                          return DropdownMenuItem(
                                            value: category,
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Text(
                                              category.name,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  hint: const Text("Selected a category"),
                                  value: _selecteditem == 0
                                      ? expenseCategory
                                      : incomeCategory,
                                  onChanged: (value) {
                                    setState(() {
                                      _selecteditem == 0
                                          ? expenseCategory =
                                              value as ExpenseCategory
                                          : incomeCategory =
                                              value as IncomeCategory;

                                      if (kDebugMode) {
                                        print(
                                          _selecteditem == 0
                                              ? expenseCategory
                                              : incomeCategory,
                                        );
                                      }
                                    });
                                  },
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                //title textfield
                                TextFormField(
                                  controller: _titleController,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Title",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                //Description textfield
                                TextFormField(
                                  controller: _descriptionController,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Description",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                //Amount textfield
                                TextFormField(
                                  controller: _amountController,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Amount",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 15,
                                    ),
                                  ),
                                ),

                                //Select Date and Select Time text fields
                                const SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1992),
                                          lastDate: DateTime(2050),
                                        ).then((value) {
                                          if (value != null) {
                                            setState(() {
                                              selectedDate = value;
                                              if (kDebugMode) {
                                                print(selectedDate);
                                              }
                                            });
                                          }
                                        });
                                      },
                                      child: CustomButton02(
                                        buttonLableName: "Select Date",
                                        buttonBackgroundColor:
                                            _selecteditem == 0
                                                ? kMainColor
                                                : kGreen,
                                        buttonLableColor: kWhite,
                                        buttonIcon: Icons.calendar_today,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.yMMMd().format(selectedDate),
                                      style: const TextStyle(
                                        color: kGrey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                //a row for selecting Time
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          if (value != null) {
                                            setState(() {
                                              selecteTime = DateTime(
                                                selectedDate.year,
                                                selectedDate.month,
                                                selectedDate.day,
                                                value.hour,
                                                value.minute,
                                              );
                                            });
                                          }
                                        });
                                      },
                                      child: CustomButton02(
                                        buttonLableName: "Select Time",
                                        buttonBackgroundColor:
                                            _selecteditem == 0
                                                ? kMainColor
                                                : kGreen,
                                        buttonLableColor: kWhite,
                                        buttonIcon: Icons.alarm,
                                      ),
                                    ),
                                    Text(
                                      DateFormat.jm().format(selecteTime),
                                      style: const TextStyle(
                                        color: kGrey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                const Divider(),

                                //Button
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      //save the user entered details in to Shared Preferences

                                      //track whether is this a expense or income
                                      if (_selecteditem == 0) {
                                        //1.load the existing expenses in the shared preferences and get the lenght and build the expense id according to the length
                                        List<Expense> loadedExpenses =
                                            await ExpenseServices()
                                                .loadExpenses();
                                        if (kDebugMode) {
                                          // ignore: prefer_interpolation_to_compose_strings
                                          print(
                                              "loaded Expenses ${loadedExpenses.length}");
                                        }

                                        //create a Expense from user entered data
                                        Expense expense = Expense(
                                          expenseId: loadedExpenses.length + 1,
                                          expenseTitle: _titleController.text,
                                          expenseAmount:
                                              _amountController.text.isEmpty
                                                  ? 0
                                                  : double.parse(
                                                      _amountController.text),
                                          expenseCategory: expenseCategory,
                                          expenseDescription:
                                              _descriptionController.text,
                                          expenseDate: selectedDate,
                                          expenseTime: selecteTime,
                                        );

                                        //save expense objects
                                        widget.addExpense(expense);

                                        //clear the the fields
                                        _titleController.clear();
                                        _amountController.clear();
                                        _descriptionController.clear();
                                      } else {
                                        //add a Income

                                        //load existing incomes
                                        List<Income> loadedIncomes =
                                            await IncomeServices()
                                                .loadingIncome();

                                        //create the new income
                                        Income newincome = Income(
                                          incomeTitle: _titleController.text,
                                          incomeId: loadedIncomes.length + 1,
                                          incomeDescription:
                                              _descriptionController.text,
                                          incomeAmount:
                                              _amountController.text.isEmpty
                                                  ? 0
                                                  : double.parse(
                                                      _amountController.text),
                                          incomeCategory: incomeCategory,
                                          incomeDate: selectedDate,
                                          incomeTime: selecteTime,
                                        );

                                        //call for addnewIncome
                                        widget.addIncome(newincome);

                                        //clear textFields
                                        _titleController.clear();
                                        _amountController.clear();
                                        _descriptionController.clear();
                                      }
                                    },
                                    child: CustomButton01(
                                        buttonLableName: _selecteditem == 0
                                            ? "Add Expense"
                                            : "Add Income",
                                        buttonBackgroundColor:
                                            _selecteditem == 0
                                                ? kMainColor
                                                : kGreen,
                                        buttonLableColor: kWhite),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                //Expense or Income display section
              ],
            ),
          ),
        ),
      ),
    );
  }
}
