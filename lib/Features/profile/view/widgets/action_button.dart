import 'package:flutter/material.dart';
import 'package:zozy/core/constants/app_color.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double size;
  final void Function()? onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(size * 0.12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryMid,
            border: Border.all(color: AppColors.accentGold, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryLight.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(4, 6),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: AppColors.accentGold,
            iconSize: size * 0.9,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: AppColors.accentGold,
            fontSize: size * 0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
