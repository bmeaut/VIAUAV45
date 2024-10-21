import 'package:animation_demo/res/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
abstract final class AppTheme {
  static final ThemeData main = ThemeData.light().copyWith(
    textTheme: _textTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: blue500),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: scaffoldBGColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(AppDimensions.h4),
        surfaceTintColor: const WidgetStatePropertyAll(transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimensions.r12)),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return blue400;
          } else if (states.contains(WidgetState.disabled)) {
            return white.withOpacity(0.5);
          } else {
            return blue700;
          }
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return blue700;
          } else if (states.contains(WidgetState.disabled)) {
            return blue800.withOpacity(0.25);
          } else {
            return white;
          }
        }),
      ),
    ),
    unselectedWidgetColor: Colors.black87,
    dividerTheme: const DividerThemeData(color: transparent),
  );

  static final TextTheme _textTheme = Typography.blackMountainView.apply(
    bodyColor: blue1100,
    displayColor: blue1100,
  );

  static const systemUiOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: scaffoldBGColor,
    systemNavigationBarDividerColor: scaffoldBGColor,
    systemNavigationBarContrastEnforced: false,
    statusBarColor: transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const scaffoldBGColor = Color(0xFFD7ECFD);

  static const black = Color.fromARGB(255, 0, 0, 0);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const transparent = Color.fromARGB(0, 0, 0, 0);

  static const Color blue50 = Color(0xFFDAF0FF);
  static const Color blue100 = Color(0xFFB5E2FF);
  static const Color blue200 = Color(0xFF8FD3FE);
  static const Color blue300 = Color(0xFF6AC5FE);
  static const Color blue400 = Color(0xFF45B6FE);
  static const Color blue500 = Color(0xFF2196F3);
  static const Color blue600 = Color(0xFF1C87E8);
  static const Color blue700 = Color(0xFF1778DD);
  static const Color blue800 = Color(0xFF1269D2);
  static const Color blue900 = Color(0xFF0D5AC7);
  static const Color blue1000 = Color(0xFF084BBC);
  static const Color blue1100 = Color(0xFF034CB1);
  static const Color blue1200 = Color(0xFF004DA6);
}
