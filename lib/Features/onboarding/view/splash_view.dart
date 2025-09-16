import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:zozy/Features/onboarding/view/onboarding_view.dart';
import 'package:zozy/core/constants/app_color.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 5), () {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingView()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientStart,
              AppColors.gradientMiddle,
              AppColors.gradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 280,
                child: Lottie.asset(
                  "assets/animations/PUDGY.json",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),

              // ✨ اسم التطبيق (Colorize Text)
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    "Zozy App",
                    textStyle: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    colors: AppColors.colorizeTextColors,
                    speed: const Duration(milliseconds: 250),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // 🌀 الوصف (Typing Text)
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    "Enjoy with Zozy",
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.2,
                    ),
                    speed: const Duration(milliseconds: 80),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
