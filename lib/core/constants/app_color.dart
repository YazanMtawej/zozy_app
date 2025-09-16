import 'package:flutter/material.dart';

class AppColors {
   // ألوان رئيسية
  static const Color primaryDark = Color(0xFF0F2027);
  static const Color primaryMid = Color(0xFF203A43);
  static const Color primaryLight = Color(0xFF2C5364);

  // ألوان إضافية
  static const Color accentGold = Color(0xFFD4AF37); // ذهبي للفخامة
  static const Color textLight = Colors.white70;
  static const Color textWhite = Colors.white;
  // 🎨 ألوان الخلفية
  static const Color gradientStart = Color(0xFF0F2027);
  static const Color gradientMiddle = Color(0xFF203A43);
  static const Color gradientEnd = Color(0xFF2C5364);

  // ✨ ألوان النصوص
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  // 🌈 ألوان أنيميشن الكتابة
  static const List<Color> colorizeTextColors = [
    Colors.white,
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
  ];

  // ⚪ ألوان مؤشرات الصفحات
  static const Color dotActive = Colors.cyanAccent;
  static const Color dotInactive = Colors.white30;
}
