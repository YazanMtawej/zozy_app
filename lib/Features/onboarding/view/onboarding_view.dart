import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zozy/Features/main/view/main_view.dart';
import 'package:zozy/Features/onboarding/view/widgets/onboarding_indicator.dart';
import 'package:zozy/Features/onboarding/view/widgets/onboarding_page.dart';
import 'package:zozy/Features/onboarding/view_model/onboarding_viewmodel.dart';
import 'package:zozy/core/constants/app_color.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Stack(
              children: [
                PageView(
                  controller: viewModel.pageController,
                  onPageChanged: viewModel.onPageChanged,
                  children: const [
                    OnboardingPage(
                      title: "Welcome 👋",
                      subtitle:
                          "Your all-in-one task manager to stay organized and productive.",
                      image: "assets/zezo/4.jpg",
                    ),
                    OnboardingPage(
                      title: "Plan with Ease 📝",
                      subtitle:
                          "Create, edit, and manage tasks seamlessly with reminders and priorities.",
                      image: "assets/zezo/2.jpg",
                    ),
                    OnboardingPage(
                      title: "Stay on Track ⭐",
                      subtitle:
                          "Track your progress and never miss important deadlines again.",
                      image: "assets/zezo/3.jpg",
                    ),
                  ],
                ),

                // Indicators + Button
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      OnboardingIndicator(
                        count: 3,
                        currentIndex: viewModel.currentPage,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentGold,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          if (viewModel.currentPage < 2) {
                            viewModel.nextPage();
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainView(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          viewModel.currentPage == 2 ? "Get Started" : "Next",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
