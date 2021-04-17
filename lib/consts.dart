import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  static const String APP_TITLE = "BAKA CLUB";

  static TextStyle trendCardDetails = GoogleFonts.cantarell();
  static TextStyle appTitleTextStyle = GoogleFonts.bangers(fontSize: 24);
  static TextStyle categoryHeading = GoogleFonts.poiretOne(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );
  static TextStyle trendCardHeading = GoogleFonts.oxygen(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle animeDetailsText = GoogleFonts.cantarell(fontSize: 16);
  static TextStyle animeDetailsEmph = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const Color APP_BAR_COLOR = Color(0xff040404);
  static const Color BACKGROUND_COLOR = Color(0xff121212);
  static Color shade = Colors.red.shade300;
  static const Color APP_ACCENT = Colors.red;
}
