import 'package:budget_buddy/screens/addnew_screen.dart';
import 'package:budget_buddy/screens/budget_screen.dart';
import 'package:budget_buddy/screens/home_screen.dart';
import 'package:budget_buddy/screens/profile_screen.dart';
import 'package:budget_buddy/screens/transactions_screen.dart';
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
  int _currentpageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //pages List
    final List<Widget> pages = [
      const HomeScreen(),
      const TransactionScreen(),
      const AddnewScreen(),
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
