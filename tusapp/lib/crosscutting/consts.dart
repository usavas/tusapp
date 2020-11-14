import 'package:flutter/material.dart';

const double kCardBorderRadiusSize = 12.0;
const double kPagePadding = 20.0;
const Color kDefaultTextColor = Color(0xFF535252);
const Color kLightTextColor = Colors.white;
const Color kWidgetBgColor = Color(0xFFFCFCFC);
const double kWidgetInnerPadding = 16.0;
const double kWidgetPadding = 32.0;

const BoxDecoration kPageBgDecoration = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [Color(0xFF405998), Color(0xFFAA27F5)],
));

final BoxDecoration kInputFieldBgDecoration = BoxDecoration(
    color: kWidgetBgColor,
    borderRadius: BorderRadius.circular(kCardBorderRadiusSize));
