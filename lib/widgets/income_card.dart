import 'package:budget_buddy/models/income_model.dart';
import 'package:budget_buddy/utils/colors.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class IncomeCard extends StatefulWidget {
  final String incomeTitle, incomeDescription;
  final IncomeCategory incomeCategory;
  final double incomeAmount;
  final DateTime incomedate, incometime;
  const IncomeCard(
      {super.key,
      required this.incomeTitle,
      required this.incomeDescription,
      required this.incomeAmount,
      required this.incomeCategory,
      required this.incomedate,
      required this.incometime});

  @override
  State<IncomeCard> createState() => _IncomeCardState();
}

class _IncomeCardState extends State<IncomeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4CA4ED), Color(0xFF0722E9)],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: kGrey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: incomeCategoryColors[widget.incomeCategory]!
                        .withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      incomeCategoryImages[widget.incomeCategory]!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.incomeTitle,
                      style: const TextStyle(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        widget.incomeDescription,
                        style: const TextStyle(
                          fontSize: 10,
                          color: kGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "- Rs ${widget.incomeAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.yMMMd().format(widget.incomedate),
                          style: const TextStyle(
                            fontSize: 10,
                            color: kGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat.jm().format(widget.incometime),
                          style: const TextStyle(
                            fontSize: 10,
                            color: kGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
