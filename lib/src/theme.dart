import 'package:flutter/material.dart';

const baseFontFamily = 'SF Pro Text';

final lightTheme = _builLightTheme();

ThemeData _builLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      secondary: const Color(0xFFE06437),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          const Color(0x80E06437),
        ),
        // shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      ),
    ),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return const TextTheme(
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: baseFontFamily,
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: baseFontFamily,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: baseFontFamily,
      fontSize: 16,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontFamily: baseFontFamily,
      fontSize: 18,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontFamily: baseFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontFamily: baseFontFamily,
      fontWeight: FontWeight.normal,
      height: 24 / 16,
      fontSize: 16,
    ),
  );
}
