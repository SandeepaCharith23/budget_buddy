import 'package:budget_buddy/data/onboarding_screen_data.dart';
import 'package:budget_buddy/screens/onboarding_screens/first_page.dart';
import 'package:budget_buddy/screens/onboarding_screens/shared_onboard_screen.dart';
import 'package:budget_buddy/screens/user_data_screen.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:budget_buddy/widgets/custom_button01.dart';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //page Controllers
  final PageController _pagecontroller = PageController();

  //create a bool for whether user can redirect to login page or not
  bool canDisplayLoginPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                //on boarding screens
                PageView(
                  controller: _pagecontroller,

                  //get the current page index
                  onPageChanged: (index) {
                    setState(() {
                      canDisplayLoginPage = index == 3;
                      // if (kDebugMode) {
                      //   print(canDisplayLoginPage);
                      // }
                    });
                  },
                  children: [
                    const FirstPage(),
                    SharedOnboardScreen(
                      pageTitle: OnboardingScreenData
                          .onboardingScreenDataLaist[0].pageTitle,
                      imageUrl: OnboardingScreenData
                          .onboardingScreenDataLaist[0].pageImageUrl,
                      pageDescription: OnboardingScreenData
                          .onboardingScreenDataLaist[0].pageDescription,
                    ),
                    SharedOnboardScreen(
                      pageTitle: OnboardingScreenData
                          .onboardingScreenDataLaist[1].pageTitle,
                      imageUrl: OnboardingScreenData
                          .onboardingScreenDataLaist[1].pageImageUrl,
                      pageDescription: OnboardingScreenData
                          .onboardingScreenDataLaist[1].pageDescription,
                    ),
                    SharedOnboardScreen(
                      pageTitle: OnboardingScreenData
                          .onboardingScreenDataLaist[2].pageTitle,
                      imageUrl: OnboardingScreenData
                          .onboardingScreenDataLaist[2].pageImageUrl,
                      pageDescription: OnboardingScreenData
                          .onboardingScreenDataLaist[2].pageDescription,
                    ),
                  ],
                ),

                //page indicator
                Container(
                  alignment: const Alignment(0, 0.6),
                  child: SmoothPageIndicator(
                    controller: _pagecontroller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),
                //Navigation Button
                Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: canDisplayLoginPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserDataScreen()),
                            );
                          },
                          child: CustomButton01(
                            buttonLableName:
                                canDisplayLoginPage ? 'Get Started' : 'Next',
                            buttonBackgroundColor: kMainColor,
                            buttonLableColor: kWhite,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _pagecontroller.animateToPage(
                              _pagecontroller.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInCirc,
                            );
                          },
                          child: CustomButton01(
                            buttonLableName:
                                canDisplayLoginPage ? 'Get Started' : 'Next',
                            buttonBackgroundColor: kMainColor,
                            buttonLableColor: kWhite,
                          ),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
