import 'package:flutter/material.dart';

import 'app_colors.dart';

/// AppTheme class provides the global theme configuration for the application
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Get the main theme data for the application
  static ThemeData get themeData {
    return ThemeData(
      // Base colors
      primaryColor: AppColors.headerButton,
      scaffoldBackgroundColor: AppColors.background,
      dividerColor: AppColors.divider,

      // Text theme
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(color: AppColors.primaryText),
        bodyMedium: const TextStyle(color: AppColors.secondaryText),
        bodySmall: const TextStyle(color: AppColors.secondaryText),
      ),

      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.headerButton,
          foregroundColor: AppColors.primaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.primaryText,
      ),
    );
  }
}
