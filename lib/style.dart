import 'package:flutter/material.dart';

String asset(String asset) {
  return 'assets/images/$asset';
}

String poster_path(String string) {
  return string;
}

String backdrop_path(String string) {
  return 'https://image.tmdb.org/t/p/original$string';
}

class Style {
  static const String FAM_NUNITO = 'Nunito';
  static const String FAM_ANTON = 'Anton';

  static final TextStyle titleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: FAM_ANTON,
  );
  static final TextStyle display1 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FAM_NUNITO);
  static final TextStyle display2 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: FAM_NUNITO,
      fontStyle: FontStyle.italic);
  static final TextStyle display3 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, fontFamily: FAM_NUNITO);

  //colors
  static const kMain = Colors.white;
  static const kOrange = const Color(0XFFF3514A);
  static const kDBlack = const Color(0XFF000000);
  static const kBlack = Color(0XFF262626);
  static const kwhite = Colors.white;
  static const kSecond = const Color(0xFF929292);
  static const kBackground = const Color(0XFFF3F3F3);
  static const kBlueGrey = const Color(0xff747E8E);
  static const kDeepPurple = const Color(0xff0000CD);
  static const APP_RED = const Color(0xffF03F36);
  static const NEAR_RED = const Color(0xFFFF4747);
  static const kDifferedBlack = const Color(0xFF272B34);
  static const kAccentColor = const Color(0xFFFFD601);
  static const kAppBarIconColor = const Color(0xFF4F4F4F);
  static const newPrimaryColor = const Color(0xFFD72C31);

  double? kwidth;
  double? kheight;
  getsize(BuildContext context) {
    kwidth = MediaQuery.of(context).size.width;
    kheight = MediaQuery.of(context).size.height;
  }
}
