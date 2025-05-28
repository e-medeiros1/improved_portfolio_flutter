import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.headerButton,
    dividerColor: AppColors.divider,
    textTheme: const TextTheme().copyWith(
      bodyLarge: const TextStyle(color: AppColors.primaryText),
      bodyMedium: const TextStyle(color: AppColors.secondaryText),
      bodySmall: const TextStyle(color: AppColors.secondaryText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.headerButton,
        foregroundColor: AppColors.primaryText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryText,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.headerButton,
    dividerColor: Colors.grey[300],
    textTheme: const TextTheme().copyWith(
      bodyLarge: const TextStyle(color: Colors.black87),
      bodyMedium: const TextStyle(color: Colors.black54),
      bodySmall: const TextStyle(color: Colors.black54),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.headerButton,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black87,
    ),
  );
}
