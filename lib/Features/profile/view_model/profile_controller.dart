import 'package:flutter/material.dart';

class ProfileController {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  ProfileController(BuildContext context) {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: Navigator.of(context),
    );

    fadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    scaleAnimation = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );

    controller.forward();
  }
}
