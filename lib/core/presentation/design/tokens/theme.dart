import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: colors.primaryColor),
    useMaterial3: true,
    primaryColor: colors.primaryColor,
    scaffoldBackgroundColor: colors.backgroundColor,
    appBarTheme: AppBarTheme(color: colors.primaryColor),
  );
}
