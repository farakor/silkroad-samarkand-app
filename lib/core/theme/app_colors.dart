import 'package:flutter/material.dart';

class AppColors {
  // Основные цвета дизайн-системы
  static const Color primary = Color(0xFFA08B54);  // #A08B54
  static const Color secondary = Color(0xFF071E3F); // #071E3F
  
  // Оттенки основного цвета
  static const Color primaryLight = Color(0xFFB8A06B);
  static const Color primaryDark = Color(0xFF8B7647);
  
  // Оттенки вторичного цвета
  static const Color secondaryLight = Color(0xFF1A3B6B);
  static const Color secondaryDark = Color(0xFF051829);
  
  // Нейтральные цвета
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);
  
  // Семантические цвета
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Цвета для UI элементов
  static const Color background = Color(0xFFFFFFF8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF8F6F3);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color onBackground = Color(0xFF1C1B1F);
  
  // Градиенты
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFFFD700), primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
} 