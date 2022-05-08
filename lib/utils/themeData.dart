import 'package:flutter/material.dart';

class AppTheme {
  // ignore: use_full_hex_values_for_flutter_colors
  static const primaryColor = Color(0xFF566BF4);
  static const gradientColor2 = Color(0xFF0F195B);
  static const accentColor = Color(0xFF4500E8);
  static const gradientBackground = LinearGradient(
    colors: [primaryColor, gradientColor2],
    begin: Alignment.topCenter,
    end: Alignment(-2, 2),
  );
  static final ligthTheme = ThemeData.light().copyWith(
    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
    )),
    primaryColor: primaryColor,
    textTheme: textTheme,
  );

  static final textTheme = const TextTheme().copyWith(
    headline6: const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
    headline5: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    bodyText2: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
  );
}
