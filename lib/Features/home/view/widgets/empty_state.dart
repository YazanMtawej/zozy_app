import 'package:flutter/material.dart';
import 'package:zozy/core/constants/app_color.dart';


class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.check_circle_outline, size: 80, color: AppColors.accentGold),
          SizedBox(height: 20),
          Text(
            "No tasks yet!",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
