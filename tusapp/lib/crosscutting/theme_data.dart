import 'package:flutter/material.dart';

import 'consts.dart';

ThemeData mainThemeData = ThemeData(
  textTheme: TextTheme(
      headline1: TextStyle(
          color: kDefaultTextColor, fontSize: 32, fontWeight: FontWeight.w400),
      headline2: TextStyle(color: kDefaultTextColor, fontSize: 24),
      headline4: TextStyle(color: kDefaultTextColor, fontSize: 20),
      headline6: TextStyle(color: kDefaultTextColor, fontSize: 18),
      button: TextStyle(color: kDefaultTextColor, fontSize: 16),
      bodyText1: TextStyle(color: kDefaultTextColor, fontSize: 16),
      bodyText2: TextStyle(color: kDefaultTextColor, fontSize: 12)),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius))),
);
