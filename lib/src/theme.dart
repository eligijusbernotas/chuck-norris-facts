import 'package:flutter/material.dart';

const _baseFontFamily = 'SF Pro Text';

final lightTheme = _builLightTheme();

ThemeData _builLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xFFE06437),
      onPrimary: Colors.black,
      background: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          const Color(0x80E06437),
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
          const Color(0xFFE06437),
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
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
