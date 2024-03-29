import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.black,
    primaryColor: AppColor.primaryColor,
    fontFamily: 'SFPro',
  ).copyWith(
    scaffoldBackgroundColor: AppColor.black,
    primaryColor: AppColor.primaryColor,
    colorScheme: ColorScheme(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondryColor,
      surface: Colors.white,
      // The background color of widgets like Card
      background: AppColor.constantGrey,
      // The default color of the Scaffold and Scrollable
      error: AppColor.errorColor,
      // Used for input validation errors, etc.
      onPrimary: Colors.white,
      // The color to use for text and icons on top of the primary color
      onSecondary: Colors.black,
      // The color to use for text and icons on top of the secondary color
      onSurface: AppColor.black,
      // The color to use for text and icons on top of the surface color
      onBackground: AppColor.black,
      // The color to use for text and icons on top of the background color
      onError: Colors.white,
      // The color to use for text and icons on top of the error color
      brightness: Brightness.light,
      // The overall theme brightness
    ),
    inputDecorationTheme: _inputDecorationTheme(),
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: AppColor.deviderGrey,
    ),
    appBarTheme: _appBarTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColor.primaryColor,
          width: 1,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(right: 5, left: 10, top: 10, bottom: 10),
        textStyle: const TextStyle(
          color: AppColor.whiteColor,
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.primaryColor;
          }
          return Colors.white;
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.primaryColor;
          }
          return AppColor.primaryColor.withOpacity(0.8);
        },
      ),
    ),
  );

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColor.black, // Keep this
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.whiteColor,
      ),
      iconTheme: IconThemeData(
        color: AppColor.whiteColor,
        size: 30,
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: const TextStyle(
        color: AppColor.primaryColor,
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
      ),
      contentPadding: const EdgeInsets.all(27),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade500, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade500, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
    );
  }
}
