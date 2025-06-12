import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DxTextStyles {
  // Text height constant
  static const double textHeight = 1.3;

  // Primary font styles with different weights
  static TextStyle primaryFont300(double size, Color color) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
        height: textHeight,
      );

  static TextStyle primaryFont400(double size, Color color) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
        height: textHeight,
      );

  static TextStyle primaryFont500(double size, Color color) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        height: textHeight,
      );

  static TextStyle primaryFont600(double size, Color color) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
        height: textHeight,
      );

  static TextStyle primaryFont700(double size, Color color) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        height: textHeight,
      );

  static TextStyle primaryFont800(double size, Color color) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: color,
        height: textHeight,
      );
}
