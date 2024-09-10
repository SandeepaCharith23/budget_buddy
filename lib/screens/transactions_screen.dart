import 'package:budget_buddy/models/expense_model.dart';
import 'package:budget_buddy/models/income_model.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/widgets/expense_card.dart';
import 'package:budget_buddy/widgets/income_card.dart';

import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expenseList;
  final List<Income> incomeList;
  final void Function(Expense) onDismissedExpense;
  const TransactionScreen(
      {super.key,
      required this.expenseList,
      required this.onDismissedExpense,
      required this.incomeList});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Financial report",
                style: TextStyle(
                  fontSize: 18,
                  color: kGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) {
                          final expense = widget.expenseList[index];
                          return Dismissible(
                            onDismissed: (direction) {
                              setState(() {
                                widget.onDismissedExpense(expense);
                              });
                            },
                            key: ValueKey(expense),
                            direction: DismissDirection.startToEnd,
                            child: ExpenseCard(
                              expenseTitle: expense.expenseTitle,
                              expenseDescription: expense.expenseDescription,
                              expenseAmount: expense.expenseAmount,
                              expenseCategory: expense.expenseCategory,
                              expensedate: expense.expenseDate,
                              expensetime: expense.expenseTime,
                            ),
                          );
                        },
                        itemCount: widget.expenseList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Incomes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) {
                          final income = widget.incomeList[index];
                          return Dismissible(
                            onDismissed: (direction) {
                              setState(() {
                                // widget.onDismissedExpense(income);
                              });
                            },
                            key: ValueKey(income),
                            direction: DismissDirection.startToEnd,
                            child: IncomeCard(
                                incomeTitle: income.incomeTitle,
                                incomeDescription: income.incomeDescription,
                                incomeAmount: income.incomeAmount,
                                incomeCategory: income.incomeCategory,
                                incomedate: income.incomeDate,
                                incometime: income.incomeTime),
                          );
                        },
                        itemCount: widget.expenseList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
