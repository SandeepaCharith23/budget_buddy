import 'package:budget_buddy/models/onboarding_screen_model.dart';

class OnboardingScreenData {
  static final List<OnboardingScreenModel> onboardingScreenDataLaist = [
    OnboardingScreenModel(
      pageTitle: "Welcome to Budget Buddy",
      pageImageUrl: "assets/icons/onboard_screen (1).png",
      pageDescription:
          "Welcome to Budget Buddy! Your personal finance partner is here to help you manage your expenses, set budgets, and achieve your financial goals. Let’s make managing money simple and stress-free.",
    ),
    OnboardingScreenModel(
      pageTitle: "Track Your Expenses Easily",
      pageImageUrl: "assets/icons/onboard_screen (2).png",
      pageDescription:
          "Keep a close eye on your spending with Budget Buddy's intuitive expense tracker. Categorize your expenses, set spending limits, and gain insights into your financial habits. Stay on top of your budget effortlessly!",
    ),
    OnboardingScreenModel(
      pageTitle: "Achieve Your Financial Goals",
      pageImageUrl: "assets/icons/onboard_screen (3).png",
      pageDescription:
          "Set and reach your financial goals with Budget Buddy. Create personalized budgets, receive helpful insights, and track your progress. Let us help you turn your financial dreams into reality.",
    ),
  ];
}
