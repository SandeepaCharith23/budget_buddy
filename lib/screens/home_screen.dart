import 'package:budget_buddy/services/user_services.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/widgets/income_expense_card.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for storing the username
  String savedusername = "";

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        //main column
        child: Column(
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
                            fontSize: 16,
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

                    const Row(
                      children: [
                        IncomeExpenseCard(
                          cardTitle: 'Income',
                          cardAmout: 275.00,
                          cardImageUrl: "assets/icons/income_icon.png",
                          cardBgColor: kGreen,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IncomeExpenseCard(
                          cardTitle: 'Expense',
                          cardAmout: 275.00,
                          cardImageUrl: "assets/icons/income_icon.png",
                          cardBgColor: kRed,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
