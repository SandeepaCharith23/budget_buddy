import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/utils/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboardScreen extends StatelessWidget {
  final String pageTitle;
  final String imageUrl;
  final String pageDescription;

  const SharedOnboardScreen(
      {super.key,
      required this.pageTitle,
      required this.imageUrl,
      required this.pageDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kdefaultpadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            pageTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: kMainColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            pageDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: kMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
