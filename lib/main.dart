import 'package:budget_buddy/screens/onboarding_screen.dart';
import 'package:budget_buddy/services/user_services.dart';
import 'package:budget_buddy/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.checkusername(),
      builder: (context, snapshot) {
        //check the snapshot is still waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        //else there is a snapshot or error
        else {
          bool hasUsername = snapshot.data ?? false;

          return MaterialApp(
            title: "Budget Buddy",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Inter",
            ),
            home: Wrapper(showMainScreen: hasUsername),
          );
        }
      },
    );
  }
}
