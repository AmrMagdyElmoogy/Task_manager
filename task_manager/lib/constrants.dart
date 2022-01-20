import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.mukta(
      color: Colors.black,
      fontSize: 28,
    ),
    headline2: GoogleFonts.mukta(
      color: Colors.black,
      fontSize: 23,
    ),
    headline3: GoogleFonts.mukta(
      color: Colors.black,
      fontSize: 18,
    ),
  );

  

  static ThemeData light() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        backwardsCompatibility: false,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: textTheme,
    );
  }
}
