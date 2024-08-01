import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //1.create a method for storing user details
  static Future<void> storeUserDetails(
      {required String userName,
      required String userEmail,
      required String userPassword,
      required String userPasswordConfirm,
      required BuildContext context}) async {
    try {
      //1.compare the passwords
      if (userPassword != userPasswordConfirm) {
        //show an error msg to display
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please match the both password again"),
            backgroundColor: Colors.redAccent,
          ),
        );

        return;
      }

      //2.if the passwords matches then save data

      //a.create an instances of shared Preference to store data
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      //b.Set values to sharedpreference instance
      await sharedPreferences.setString("username", userName);
      await sharedPreferences.setString("useremail", userEmail);
      await sharedPreferences.setString("userpassword", userPassword);

      //c.Show a msg to user
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Successfully saved user details to SharedPreferences"),
            backgroundColor: Colors.blue,
          ),
        );
      }
    } catch (err) {
      err.toString();
    }
  }

  //2.Method for checking that username already saved  or not
  static Future<bool> checkusername() async {
    //a.create an insatance of sharedPreference
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? savedusername = sharedPreferences.getString("username");
    return savedusername != null;
  }

  //3.Method for returning saved User Name and Email Address
  static Future<Map<String, String>> userDetails() async {
    //a.create an insatance of sharedPreference
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? username = sharedPreferences.getString("username");
    String? useremail = sharedPreferences.getString("useremail");

    return {"username": username!, "useremail": useremail!};
  }
}
