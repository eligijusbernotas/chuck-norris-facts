import 'package:chuck_norris_facts/src/colors.dart';
import 'package:flutter/material.dart';

const _baseFontFamily = 'SF Pro Text';

final lightTheme = _builLightTheme();
final darkTheme = _buildDarkThem();

ThemeData _buildDarkThem() {
  final base = ThemeData.dark();

  return base.copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          AppColors.primary.withOpacity(.8),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        side: MaterialStateProperty.all(BorderSide.none),
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.primary,
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        overlayColor: MaterialStateProperty.all(
          const Color(0x1A000000),
        ),
      ),
    ),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}

ThemeData _builLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: Colors.black,
      background: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          AppColors.primary.withOpacity(.8),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        side: MaterialStateProperty.all(BorderSide.none),
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.primary,
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        overlayColor: MaterialStateProperty.all(
          const Color(0x1A000000),
        ),
      ),
    ),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return const TextTheme(
    headline6: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: -.47,
      height: 16 / 22,
      color: Color(0xFF222222),
      fontFamily: _baseFontFamily,
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: _baseFontFamily,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: _baseFontFamily,
      fontSize: 16,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontFamily: _baseFontFamily,
      fontSize: 18,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontFamily: _baseFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontFamily: _baseFontFamily,
      fontWeight: FontWeight.normal,
      height: 24 / 16,
      fontSize: 16,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontFamily: _baseFontFamily,
      fontWeight: FontWeight.normal,
      height: 20 / 16,
      letterSpacing: -.24,
      fontSize: 16,
    ),
  );
}
