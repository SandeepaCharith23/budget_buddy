import 'package:budget_buddy/utils/colors.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Budget Buddy",
          style: TextStyle(
            fontSize: 40,
            color: kMainColor,
          ),
        ),
        Image.asset(
          "assets/icons/C.png",
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          fit: BoxFit.cover,
        ),
        const Text(
          "Track |Save | Prosper",
          style: TextStyle(
            fontSize: 20,
            color: kMainColor,
          ),
        ),
      ],
    );
  }
}
