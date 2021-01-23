import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color bgcolor = Colors.grey[300];
Color textColor = Colors.black87;
Color promotionsColors = Colors.green;
Color inboxColor = Colors.blue;
Color socialColor = Colors.red;
Color unselectedIconColor = Colors.grey;

///butler for the header
///gotham pro for body
TextTheme pf = TextTheme(
  headline1: TextStyle(fontFamily: "Butler", color: textColor, fontSize: 38),
  headline2: TextStyle(
      fontFamily: "Gotham",
      fontWeight: FontWeight.bold,
      color: textColor,
      fontSize: 18),
  headline3: GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
  headline4: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
  headline5: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.normal, color: textColor),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w200, color: textColor),
  headline6: TextStyle(
      fontFamily: "Gotham",
      fontWeight: FontWeight.bold,
      color: textColor,
      fontSize: 13),
  bodyText1: TextStyle(
      fontFamily: "Gotham",
      fontWeight: FontWeight.normal,
      color: textColor,
      fontSize: 12),
);
