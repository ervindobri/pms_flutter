


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors{
      static const Map<int, Color> colorCodes = {
        50: Color.fromRGBO(147, 205, 72, .1),
        100: Color.fromRGBO(147, 205, 72, .2),
        200: Color.fromRGBO(147, 205, 72, .3),
        300: Color.fromRGBO(147, 205, 72, .4),
        400: Color.fromRGBO(147, 205, 72, .5),
        500: Color.fromRGBO(147, 205, 72, .6),
        600: Color.fromRGBO(147, 205, 72, .7),
        700: Color.fromRGBO(147, 205, 72, .8),
        800: Color.fromRGBO(147, 205, 72, .9),
        900: Color.fromRGBO(147, 205, 72, 1),
        };
      // Green color code: FF93cd48
      static const primaryColor = const Color(0xff84A128);
      static const oliveDarker = const Color(0xff445626);
      static const oliveDark = const Color(0xff452682d);
      static const oliveMid = const Color(0xff6e8b3d);
      static const oliveLight = const Color(0xff7c9d45);
      static const oliveLighter = const Color(0xff96b85d);
      static const greyTextColor = const Color(0xff565656);

      static const eronOliveLight = const Color(0xff93bb1b);
      static const eronOliveDark = const Color(0xff698c00);
      static const erondGreen = const Color(0xff067f4b);

      static const vibrantGreen = const Color(0xff0ee398);

      static var mediumWhiteStyle = GoogleFonts.lato(
      color: Colors.white,
      fontSize: 15
      );
      static var bigWhiteStyle = GoogleFonts.lato(
          color: Colors.white,
          fontSize: 20
      );

      static var mediumDarkStyle = GoogleFonts.lato(
          color: greyTextColor,
          fontSize: 15
      );

      static var thickDarkstyle = GoogleFonts.lato(
          color: greyTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 15
      );

      static var bigDarkStyle = GoogleFonts.lato(
          color: greyTextColor,
          fontSize: 20
      );

      static var thickLightStyle = GoogleFonts.lato(
          color: CupertinoColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 15
      );


      static var radius15 = BorderRadius.circular(15);
      static var radius25 = BorderRadius.circular(25);

      static final List<BoxShadow> greenShadow = [
        BoxShadow(
            color: ThemeColors.vibrantGreen.withOpacity(.2),
            blurRadius: 40,
            spreadRadius: -5
        )];

      static final List<BoxShadow> greyShadow = [
        BoxShadow(
            color: Colors.grey.shade400.withOpacity(.2),
            blurRadius: 40,
            spreadRadius: -5
        )];

  static var lightVibrantGreenColor = const Color(0xff4ecc97);

  static var almostBlack = const Color(0xff2f2f31);
}