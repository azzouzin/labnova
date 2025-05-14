import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextThemes {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle TextStyle18 = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle TextStyle16 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle TextStyle14 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
