import 'package:budget_buddy/screens/main_screen.dart';
import 'package:budget_buddy/services/user_services.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/widgets/custom_button01.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //booling value for checkbox
  bool rememberme = false;

  //form key for the form validation
  final _formKey = GlobalKey<FormState>();

  //controllers for the text
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userConfirmPasswordController =
      TextEditingController();

  //using dispose method for garbage collector
  @override
  void dispose() {
    _userNameController.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userConfirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom login"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const Text(
                  "Please enter your Personal details and suitable password.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //Form for personal data
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      //username textInput field
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your User Name";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.verified_user),
                          label: const Text("UserName"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //user email address textInput field
                      TextFormField(
                        controller: _userEmailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your User Email address";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your Email address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.email_outlined),
                          label: const Text("Email address"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //user password address textInput field
                      TextFormField(
                        controller: _userPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter a Suitable password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter a suitable password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.remove_red_eye_outlined),
                          label: const Text("User Password"),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //confirm user password address textInput field
                      TextFormField(
                        controller: _userConfirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please confirm your Entered password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: const Icon(Icons.remove_red_eye_outlined),
                          label: const Text("Confirm Password"),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //Remember me text and Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Remember me for the next time ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                                value: rememberme,
                                onChanged: (value) {
                                  setState(() {
                                    rememberme = value!;
                                  });
                                }),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              //form is validated

                              //1.get the values
                              String enteredUserName = _userNameController.text;
                              String enteredUserEmail =
                                  _userEmailController.text;
                              String enteredUserPassword =
                                  _userPasswordController.text;
                              String enteredUserPasswordConfirm =
                                  _userConfirmPasswordController.text;

                              if (kDebugMode) {
                                print(
                                    "$enteredUserName,$enteredUserEmail,$enteredUserPassword,$enteredUserPasswordConfirm");
                              }

                              //2.store user details using shared preferences
                              await UserServices.storeUserDetails(
                                userName: enteredUserName,
                                userEmail: enteredUserEmail,
                                userPassword: enteredUserPassword,
                                userPasswordConfirm: enteredUserPasswordConfirm,
                                context: context,
                              );

                              if (context.mounted) {
                                //3.Navigate to the main Dashbaord
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const MainScreen();
                                    },
                                  ),
                                );
                              }
                            }
                          },
                          child: const CustomButton01(
                            buttonLableName: "Sign Up",
                            buttonBackgroundColor: kMainColor,
                            buttonLableColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
