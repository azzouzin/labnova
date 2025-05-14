import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xff61F2F5),
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'GTSectra',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black54,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xffE0E0E0),
      primary: Colors.blue,
      secondary: Color(0xff723881),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Color(0xff100B20),
    fontFamily: 'Roboto',
    textTheme: GoogleFonts.montserratTextTheme(
      TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.white54,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: Colors.blue,
      secondary: Colors.blueAccent,
      background: Colors.grey[900]!,
      brightness: Brightness.dark,
    ),
  );

  static const Duration navigationDuration = Duration(seconds: 1);
}

String kHomeView = '/home';
