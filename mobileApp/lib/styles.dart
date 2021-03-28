import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kColorGreen = Color.fromRGBO(85, 136, 79, 1);
Color kColorOrange = Color.fromRGBO(237, 172, 72, 1);
Color kColorGray = Color.fromRGBO(123, 123, 123, 1);
Color kColorGrayMin = Color.fromRGBO(201, 201, 201, 1);
Color kColorBlue = Color.fromRGBO(0, 76, 76, 1);
Color kColorPurp = Color.fromRGBO(84, 79, 136, 1);
Color kColorDin = kColorOrange;
TextStyle kDefaultFont = GoogleFonts.montserrat();

TextStyle kTitleTextStyle = GoogleFonts.pacifico().copyWith(
  fontSize: 40,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

TextStyle kSubtitleTextStyle = kDefaultFont.copyWith(
  fontSize: 10,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

TextStyle kSectionTitleTextStyle = kDefaultFont.copyWith(
  fontSize: 18,
  fontWeight: FontWeight.w300,
  color: Colors.black,
);

TextStyle kSmallCardTextStyle = kDefaultFont.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w200,
);

InputDecoration kDefaultInput = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

BoxDecoration kCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
);
