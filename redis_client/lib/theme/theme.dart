import 'package:flutter/material.dart';
import 'package:redis_client/theme/color.dart';

ThemeData buildRedisClientTheme(ThemeData baseTheme) {
  return baseTheme.copyWith(
    colorScheme: baseTheme.colorScheme.copyWith(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secondary,
      secondaryVariant: secondaryVariant,
      background: primary,
      surface: secondary,
    ),
  );
}
