import 'package:pruebaflutter1/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleStylesDefault {
  static const white = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: MyColors.primary,
  );
}

class BodyStylesDefault {
  static const white = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: MyColors.primary,
  );
}

class HeadingStylesDefault {
  static const white = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: MyColors.black,
  );
  static const accent = TextStyle(
    fontFamily: 'RobotoMono',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: MyColors.accent,
  );
}

class HeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: MyColors.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: MyColors.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class SubHeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class HeadingStylesGradient {
  static const white = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class SubHeadingStylesGradient {
  static const white = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: MyColors.primary,
  );
}

class LabelStyles {
  static const white = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class Style {
  static const baseTextStyle = TextStyle(fontFamily: 'Poppins');
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 14.0,
      fontWeight: FontWeight.w400);
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400);
}
