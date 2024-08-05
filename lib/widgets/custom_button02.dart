import 'package:flutter/material.dart';

class CustomButton02 extends StatelessWidget {
  final String buttonLableName;
  final Color buttonBackgroundColor;
  final Color buttonLableColor;
  final IconData? buttonIcon;

  const CustomButton02(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                buttonIcon,
                color: buttonLableColor.withOpacity(0.8),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                buttonLableName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: buttonLableColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
