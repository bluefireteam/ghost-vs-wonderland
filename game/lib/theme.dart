import 'package:flutter/material.dart';

const fontColor = Color(0xFF003d39);
const backgroundColor = Color(0xFFc2e6a8);
const fontFamily = 'spookyhouse';

final gameTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  backgroundColor: backgroundColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    headline2: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    headline3: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    headline4: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    headline5: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    headline6: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    subtitle1: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    subtitle2: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    bodyText1: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
    bodyText2: TextStyle(
      color: fontColor,
      fontFamily: fontFamily,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xFFb2c736),
      ),
      textStyle: MaterialStateProperty.all(const TextStyle(
        color: fontColor,
        fontFamily: fontFamily,
      )),
    ),
  ),
);
