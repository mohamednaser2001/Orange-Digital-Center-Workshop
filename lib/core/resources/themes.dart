import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


abstract class AppClolorsTwo {
  static const secondary = Colors.deepOrange;// Color(0xFF3B76F6);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppClolorsTwo.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppClolorsTwo.cardDark;
}

/// Reference to the application theme.
class MyAppTheme {
  static const accentColor = AppClolorsTwo.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Light theme and its settings.
  ThemeData get light => ThemeData(

    brightness: Brightness.light,
    colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.mulishTextTheme().apply(bodyColor: AppClolorsTwo.textDark),
    backgroundColor: _LightColors.background,
    appBarTheme: lightBase.appBarTheme.copyWith(
      iconTheme: lightBase.iconTheme,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: AppClolorsTwo.textDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: _LightColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary:Colors.deepOrange,)// AppClolorsTwo.secondary),
    ),
    cardColor: _LightColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppClolorsTwo.textDark),
    ),
    iconTheme: const IconThemeData(color: AppClolorsTwo.iconDark),
  );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.interTextTheme().apply(bodyColor: AppClolorsTwo.textLigth),
    backgroundColor: _DarkColors.background,
    appBarTheme: darkBase.appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    scaffoldBackgroundColor: _DarkColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppClolorsTwo.secondary),
    ),
    cardColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppClolorsTwo.textLigth),
    ),
    iconTheme: const IconThemeData(color: AppClolorsTwo.iconLight),
  );
}