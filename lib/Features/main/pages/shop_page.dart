import 'package:flutter/material.dart';
import 'package:zozy/core/constants/app_color.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          "Shop Our Products",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.accentGold,
          ),
        ),
      ),
    );
  }
}
