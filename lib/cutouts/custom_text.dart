import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText {

  // final myTextStyleLarge = GoogleFonts.cormorantGaramond(
    
  //     fontSize: 36,
  //     fontWeight: FontWeight.w800,
  //     color: Colors.brown,
  // );

  static TextStyle myTextStyleLarge() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 36,
      fontWeight: FontWeight.w800,
      color: Colors.brown
    );
  }

  static TextStyle myTextStyleSilver() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: const Color.fromARGB(255, 245, 236, 225)
    );
  }

  static TextStyle myTextStyleMedium() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: Colors.brown
    );
  }


  static TextStyle myTextStyleHintText() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: const Color.fromARGB(255, 139, 102, 89)
    );
  }


  static TextStyle myTextStyleItemCard() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: const Color.fromARGB(255, 255, 241, 236),
    );
  }

  static TextStyle myTextStyleAuthButton() {
    return GoogleFonts.cormorantGaramond(
      color: Colors.white70,
      fontSize: 30,
      fontWeight: FontWeight.w300,
    );
    
  }

  static TextStyle myTextStyleSmall() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 18,
      fontWeight: FontWeight.w200,
      color: Colors.brown
    );
  }

  static TextStyle myTextStyleSmallItemCard() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 18,
      fontWeight: FontWeight.w200,
      color: const Color.fromARGB(255, 255, 241, 236),
    );
  }

  static TextStyle myTextStyleCategoriesRow() {
    return GoogleFonts.cormorantGaramond(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      color: const Color.fromARGB(255, 53, 32, 24)
    );
  }
  // TextStyle myCustomTextStyleLarge(
  //   {
  //     double myFontSize = 36,
  //     myFontWeight = FontWeight.w800,
  //     myColor = Colors.brown,
  //   }
  // ) => GoogleFonts.cormorantGaramond (
  //   fontSize: myFontSize,
  //   fontWeight: myFontWeight,
  //   color: myColor,
  // );

}

