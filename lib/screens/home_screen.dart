import 'package:budget_buddy/models/expense_model.dart';
import 'package:budget_buddy/models/income_model.dart';
import 'package:budget_buddy/services/user_services.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/utils/constants.dart';
import 'package:budget_buddy/widgets/expense_card.dart';
import 'package:budget_buddy/widgets/income_card.dart';
import 'package:budget_buddy/widgets/income_expense_card.dart';
import 'package:budget_buddy/widgets/line_chart_sample.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Expense> expenseList;
  final List<Income> incomeList;
  const HomeScreen(
      {super.key, required this.expenseList, required this.incomeList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for storing the username
  String savedusername = "";
  double incomeTotal = 0.0;
  double expenseTotal = 0.0;

  @override
  void initState() {
    //get the username and user Email
    UserServices.userDetails().then((value) {
      if (value['username'] != null) {
        setState(() {
          savedusername = value['username']!;
        });
        // if (kDebugMode) {
        //   print(savedusername);
        // }
      }
    });

    //calculate total income amount and expense amaout of the user
    setState(() {
      for (var i = 0; i < widget.incomeList.length; i++) {
        incomeTotal += widget.incomeList[i].incomeAmount;
      }
      for (var i = 0; i < widget.expenseList.length; i++) {
        expenseTotal += widget.expenseList[i].expenseAmount;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        //main column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //01.user details and Tile Section
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: kMainLightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //user details and notification section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2.0,
                              color: kWhite,
                            ),
                          ),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/icons/C.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Welcome ${savedusername.toUpperCase()}",
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 10,
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            size: 25,
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    //Expense card summary card and Income Card summary.
                    Row(
                      children: [
                        IncomeExpenseCard(
                          cardTitle: 'Income',
                          cardAmout: incomeTotal,
                          cardImageUrl: "assets/icons/income_icon.png",
                          cardBgColor: kGreen,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IncomeExpenseCard(
                          cardTitle: 'Expense',
                          cardAmout: expenseTotal,
                          cardImageUrl: "assets/icons/income_icon.png",
                          cardBgColor: kRed,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const Divider(),
            //
            Padding(
              padding: const EdgeInsets.all(kdefaultpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Here's how you spend your expenses...",
                    style: TextStyle(
                      fontSize: kdefaultsubheadingfontsize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //Line chart for user expenses
                  const LineChartSample(),

                  //Display section of recent Transactions
                  const Text(
                    "Your recent transactions...",
                    style: TextStyle(
                      fontSize: kdefaultsubheadingfontsize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //recent transactions listview
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your recent expenses...",
                        style: TextStyle(
                          fontSize: kdefaultsubheadingfontsize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widget.expenseList.isEmpty
                          ? const Center(
                              child: Text(
                                "There are no recent expense to display ,Please add some expense details here",
                                style: TextStyle(
                                  fontSize: kdefaultsubheadingfontsize,
                                  color: kGrey,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                final expense = widget.expenseList[index];
                                return ExpenseCard(
                                  expenseTitle: expense.expenseTitle,
                                  expenseDescription:
                                      expense.expenseDescription,
                                  expenseAmount: expense.expenseAmount,
                                  expenseCategory: expense.expenseCategory,
                                  expensedate: expense.expenseDate,
                                  expensetime: expense.expenseTime,
                                );
                              },
                              itemCount: widget.expenseList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                            ),
                      const Divider(),
                      const Text(
                        "Your recent Incomes...",
                        style: TextStyle(
                          fontSize: kdefaultsubheadingfontsize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widget.incomeList.isEmpty
                          ? const Center(
                              child: Text(
                                "There are no recent incomes to display ,Please add some income details here",
                                style: TextStyle(
                                  fontSize: kdefaultsubheadingfontsize,
                                  color: kGrey,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                final income = widget.incomeList[index];
                                return IncomeCard(
                                    incomeTitle: income.incomeTitle,
                                    incomeDescription: income.incomeDescription,
                                    incomeAmount: income.incomeAmount,
                                    incomeCategory: income.incomeCategory,
                                    incomedate: income.incomeDate,
                                    incometime: income.incomeTime);
                              },
                              itemCount: widget.incomeList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
