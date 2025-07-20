import 'package:docdoc_app/core/style/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final theme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: AppColors.backgroundColor,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
