import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zozy/core/constants/app_color.dart';
import '../view_model/profile_controller.dart';
import 'widgets/profile_image.dart';
import 'widgets/action_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProfileController(context);

    return Scaffold(
      backgroundColor: AppColors.primaryMid,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;
            final profileImageSize = isTablet ? 220.0 : 150.0;
            final iconSize = isTablet ? 40.0 : 28.0;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FadeTransition(
                opacity: controller.fadeAnimation,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      ProfileImage(
                        size: profileImageSize,
                        animation: controller.scaleAnimation,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Yazan Mtawej",
                        style: TextStyle(
                          fontSize: isTablet ? 32 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentGold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: isTablet ? 20 : 14,
                          color: AppColors.textLight.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // الأزرار
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActionButton(
                            icon: Icons.settings,
                            label: "Settings",
                            size: iconSize,
                            onPressed: () {},
                          ),
                          SizedBox(width: isTablet ? 40 : 20),
                          ActionButton(
                            icon: Icons.history,
                            label: "History",
                            size: iconSize,
                            onPressed: () {},
                          ),
                          SizedBox(width: isTablet ? 40 : 20),
                          ActionButton(
                            icon: Icons.logout,
                            label: "Logout",
                            size: iconSize,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.33,
                            height: MediaQuery.of(context).size.width*0.7,
                            child: Lottie.asset(
                              "assets/animations/PUDGY.json",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.33,
                            height: MediaQuery.of(context).size.width*0.7,
                            child: Lottie.asset(
                              "assets/animations/PUDGY.json",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.33,
                            height: MediaQuery.of(context).size.width*0.7,
                            child: Lottie.asset(
                              "assets/animations/PUDGY.json",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
