import 'package:flutter/material.dart';

class CustomButton01 extends StatelessWidget {
  final String buttonLableName;
  final Color buttonBackgroundColor;
  final Color buttonLableColor;
  final IconData? buttonIcon;

  const CustomButton01(
      {super.key,
      required this.buttonLableName,
      required this.buttonBackgroundColor,
      required this.buttonLableColor,
      this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonBackgroundColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              buttonLableName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: buttonLableColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
