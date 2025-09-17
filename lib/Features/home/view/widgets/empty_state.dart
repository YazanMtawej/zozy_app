import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zozy/core/constants/app_color.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryLight,
            AppColors.primaryMid,
            AppColors.primaryLight,
            AppColors.primaryMid,
            AppColors.primaryLight,
            AppColors.primaryMid,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_outlined, size: 50, color: AppColors.accentGold),
            SizedBox(height: 10),
            Text(
              "No tasks yet!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
              ),
            ),
            SizedBox(
              height: 170,
              child: Lottie.asset(
                "assets/animations/Cycling.json",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
