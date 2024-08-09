import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Widgets {
  textWidget({data, color, size, weight}) {
    return Text(
      data,
      style: GoogleFonts.aBeeZee(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
