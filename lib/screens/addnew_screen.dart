import 'package:budget_buddy/utils/colors.dart';
import 'package:flutter/material.dart';

class AddnewScreen extends StatefulWidget {
  const AddnewScreen({super.key});

  @override
  State<AddnewScreen> createState() => _AddnewScreenState();
}

class _AddnewScreenState extends State<AddnewScreen> {
  //track the selected item-Expense or Category
  int _selecteditem = 0;

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

                //Expense or Income display section
                // Positioned(
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.height * 0.5,
                //     decoration: BoxDecoration(
                //       color: kWhite,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
