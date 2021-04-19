import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  static const String APP_TITLE = "BAKA CLUB";

  // That style tho
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

  // Colors
  static const Color APP_BAR_COLOR = Color(0xff040404);
  static const Color BACKGROUND_COLOR = Color(0xff121212);
  static Color shade = Colors.red.shade300;
  static const Color APP_ACCENT = Colors.red;

  // Links
  static const String GITHUB_PROFILE_URL = "https://github.com/flyingcakes85";
  static const String REPO_LICENSE_URL =
      "https://raw.githubusercontent.com/flyingcakes85/baka-anime/main/LICENSE";
  static const String PROFILE_PIC_URL =
      "https://avatars.githubusercontent.com/u/48585950?v=4";

  // Strings
  static const String DETAILS_GARBAGE =
      "Was supposed to be making an app to pull down data from a news API. As usual, my weeb side sabotaged me and forced me into churning out this app. Just to be on the safe side, I wrapped this page into a Single Child Scroll View. But yeah, I am too lazy to actually write enough stuff to require scrolling.";
  static const String EMPTY_WATCHLIST_HINT =
      "Add shows to your watchlist by tapping the star icon on top right on details page of an anime.";
  static const String EMPTY_WATCHLIST = "Watchlist Empty";
  static const String YOUR_WATCHLIST = "Your Watchlist";
  static const String TRENDING = "Trending";
  static const String ABOUT_TEXT =
      "Linux evangelist, JavaScript hater;\nProgrammer Dvorak\n--> 80's was the future <--";
  static const String NAME = "Snehit Sah";
  static const String NICK = "@flyingcakes";
}
