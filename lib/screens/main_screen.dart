import 'package:budget_buddy/models/expense_model.dart';
import 'package:budget_buddy/models/income_model.dart';
import 'package:budget_buddy/screens/addnew_screen.dart';
import 'package:budget_buddy/screens/budget_screen.dart';
import 'package:budget_buddy/screens/home_screen.dart';
import 'package:budget_buddy/screens/profile_screen.dart';
import 'package:budget_buddy/screens/transactions_screen.dart';
import 'package:budget_buddy/services/expense_services.dart';
import 'package:budget_buddy/services/income_services.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _currentpageIndex = 2;

  //A place for saving all sharedPreferences in to new place
  List<Expense> expenseList = [];

  List<Income> incomeList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      //call for fetchAllExpenses at the beginnig
      fetchAllExpenses();

      //call for fetchAllIncomes at the beginning
      fetchAllIncomes();
    });
  }

  //A method for fetch expenses
  void fetchAllExpenses() async {
    List<Expense> loadedExpenses = await ExpenseServices().loadExpenses();
    //update expenselsit
    setState(() {
      expenseList = loadedExpenses;
      if (kDebugMode) {
        print(
            "expense list lenght in fetchallmethod at the beginning ${expenseList.length}");
      }
    });
  }

  //A method for fetch all incomes
  void fetchAllIncomes() async {
    List<Income> loadedIncomes = await IncomeServices().loadingIncome();
    setState(() {
      incomeList = loadedIncomes;
      if (kDebugMode) {
        print(
            "income list lenght in fetchallmethod at the beginning ${incomeList.length}");
      }
    });
  }

  //A method for add new expense
  void addNewExpense(Expense newExpense) {
    //using already define methods in expense services
    ExpenseServices().saveExpenses(newExpense, context);

    //update expense list
    setState(() {
      expenseList.add(newExpense);
      if (kDebugMode) {
        print("Expenses amount after add new Expense ${expenseList.length}");
      }
    });
  }

  //A method for add new Income
  void addNewIncome(Income newIncome) {
    //save new income
    IncomeServices().saveIncome(newIncome, context);

    //update incomeList
    setState(() {
      incomeList.add(newIncome);
      if (kDebugMode) {
        print("Incomes amount after add new Income ${incomeList.length}");
      }
    });
  }

  // A function to remove a expense
  void removeExpense(Expense expense) {
    ExpenseServices().deleteExpense(expense.expenseId, context);
    setState(() {
      expenseList.remove(expense);
    });
  }

  //A function to remove a income
  void removeIncome(Income income) {
    IncomeServices().deleteIncome(income.incomeId, context);
    setState(() {
      incomeList.remove(income);
    });
  }

  @override
  Widget build(BuildContext context) {
    //pages List
    final List<Widget> pages = [
      HomeScreen(
        expenseList: expenseList,
        incomeList: incomeList,
      ),
      TransactionScreen(
        expenseList: expenseList,
        onDismissedExpense: removeExpense,
        incomeList: incomeList,
        onDismissedIncome: removeIncome,
      ),
      AddnewScreen(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      const BudgetScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          selectedItemColor: kMainColor,
          unselectedItemColor: kGrey,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          onTap: (index) {
            setState(() {
              _currentpageIndex = index;
              if (kDebugMode) {
                print(_currentpageIndex);
              }
            });
          },
          currentIndex: _currentpageIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: kGrey,
              ),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.list_rounded,
                color: kGrey,
              ),
              label: "Transaction",
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kMainColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: kWhite,
                  size: 40,
                ),
              ),
              label: "Add New",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.rocket,
                color: kGrey,
              ),
              label: "Budget",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: kGrey,
              ),
              label: "Profile",
            ),
          ]),
      body: pages[_currentpageIndex],
    );
  }
}
