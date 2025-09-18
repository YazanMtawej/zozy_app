import 'package:flutter/material.dart';
import 'package:zozy/core/constants/app_color.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryDark,
            AppColors.primaryMid,
            AppColors.primaryLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // صورة رئيسية
          Center(
            child: Container(
              padding: const EdgeInsets.all(
                16,
              ), // مسافة داخلية تعطي تنفس للصورة
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  // جمالية إضافية مع تدرج
                  colors: [
                    AppColors.primaryMid,
                    AppColors.dotActive,
                    AppColors.dotInactive,
                    AppColors.primaryLight,
                    AppColors.primaryMid,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(width: 6, color: AppColors.accentGold),
                boxShadow: [
                  // ظل ناعم للصورة
                  BoxShadow(
                    color: AppColors.accentGold.withAlpha(600),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(5, 8),
                  ),
                ],
              ),
              child: ClipOval(
                // قص الصورة لتكون دائرية بالكامل
                child: Image.asset(
                  image,
                  fit: BoxFit.fill, // يغطي الدائرة بدون فراغات
                  width:
                      MediaQuery.of(context).size.width *
                      0.72, // مرونة على كل الشاشات
                  height: MediaQuery.of(context).size.width * 0.72,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // العنوان
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textWhite,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 20),

          // النص التوضيحي
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textLight,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
