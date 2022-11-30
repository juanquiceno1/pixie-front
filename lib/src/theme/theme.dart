/// Here the theme of the app is established (colors, fonts with their sizes and characteristics).
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'colors.dart';

ThemeData lightThemeData = ThemeData(
  primarySwatch: AppColors.primaryColor.toMaterialColor(),
  primaryColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: AppColors.white,
  errorColor: AppColors.red,
  hoverColor: AppColors.primaryLightColor,
  bottomAppBarColor: Colors.blueGrey[900],
  iconTheme: IconThemeData(color: AppColors.primaryColor, size: 24),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 10,
    centerTitle: false,
    titleSpacing: 0,
    iconTheme: IconThemeData(
      color: AppColors.textColor,
      size: 24,
    ),
    titleTextStyle: GoogleFonts.roboto(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  textTheme: TextTheme(
    headline4: GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
  ),
  primaryTextTheme: TextTheme(
    button: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 34,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 24,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 20,
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 14,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    caption: GoogleFonts.roboto(
      fontSize: 12,
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
    ),
  ),
);

ThemeData darkThemeData = ThemeData(
  primarySwatch: AppColors.primaryColor.toMaterialColor(),
  primaryColor: AppColors.primaryColor,
  backgroundColor: Colors.blueGrey[900],
  cardColor: Color(0xFF2A2D3E),
  errorColor: AppColors.red,
  hoverColor: Color.fromARGB(255, 199, 216, 229).withOpacity(0.2),
  bottomAppBarColor: Colors.black,
  iconTheme: IconThemeData(
    color: AppColors.primaryColor,
    size: 28,
  ),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF212332),
    elevation: 10,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white54),
    titleTextStyle: TextStyle(
      color: Colors.blueGrey[100],
      fontSize: 20,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      letterSpacing: 3,
    ),
  ),
  primaryTextTheme: TextTheme(
    button: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    headline4: TextStyle(
      fontSize: 34,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 20,
      color: AppColors.white,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
);
