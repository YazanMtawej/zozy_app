import 'package:flutter/material.dart';
import 'package:zozy/core/constants/app_color.dart';

class ProfileImage extends StatelessWidget {
  final double size;
  final Animation<double> animation;

  const ProfileImage({
    super.key,
    required this.size,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Container(
        padding: EdgeInsets.all(size * 0.04),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.primaryDark,
              AppColors.primaryMid,
              AppColors.primaryLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(width: size * 0.06, color: AppColors.accentGold),
          boxShadow: [
            BoxShadow(
              color: AppColors.dotActive.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(5, 8),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            "assets/dudu/7f34bd2944f235fce77e0d734dc86c15.jpg",
            fit: BoxFit.cover,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
