import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextThemes {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );
  static TextStyle TextStyle24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Color(0xff595959),
    letterSpacing: 2,
  );
  static TextStyle TextStyle18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle TextStyle20 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color(0xff595959),
  );
  static TextStyle TextStyle16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle TextStyle14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff8C8C8C),
  );
}
