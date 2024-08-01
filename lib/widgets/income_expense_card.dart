import 'package:budget_buddy/utils/colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenseCard extends StatefulWidget {
  final String cardTitle;
  final double cardAmout;
  final String cardImageUrl;
  final Color cardBgColor;
  const IncomeExpenseCard(
      {super.key,
      required this.cardTitle,
      required this.cardAmout,
      required this.cardImageUrl,
      required this.cardBgColor});

  @override
  State<IncomeExpenseCard> createState() => _IncomeExpensCardState();
}

class _IncomeExpensCardState extends State<IncomeExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: widget.cardBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              widget.cardImageUrl,
              color: kWhite,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Text(
                  widget.cardTitle,
                  style: const TextStyle(
                    color: kWhite,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Rs ${widget.cardAmout.toString()}",
                  style: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
