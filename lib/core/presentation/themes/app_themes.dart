import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppThemes {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        primaryColor: colorScheme.onSurface,
        primaryColorLight: primaryColorLight,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          color: colorScheme.primary,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        buttonTheme: ButtonThemeData(
          buttonColor: colorScheme.onSurface,
        ),
        textTheme: textTheme,
        fontFamily: 'Roboto',
        dividerColor: dividerColor,
        disabledColor: disabledColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colorScheme.primary,
        ));
  }

  static const textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: primaryColorDark,
    ),
    headline2: TextStyle(
      fontSize: 14,
      color: whiteColor,
    ),
    headline4: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
    ),
    headline5: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
    ),
    bodyText1:
        TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
      fontSize: 14,
    ),
    labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    caption: TextStyle(fontSize: 12, color: Colors.grey),
    overline: TextStyle(fontSize: 13, color: Colors.white),
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    secondary: secondaryColor,
    background: scaffoldBackgroundColor,
    surface: Colors.white,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: primaryColor,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: primaryColor,
    secondary: secondaryColor,
    background: backgroundDark,
    surface: Color(0xff1E2746),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );
}
