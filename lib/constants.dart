import 'package:flutter/material.dart';

Color kMainBGColor = Color(0xFFFBFCFF);
Color kMainAccentColor = Color(0xFFF2CD37);
double kBorderRadius = 20;
BoxShadow kSubtleShadow = BoxShadow(
    color: Colors.black.withOpacity(0.05),
    blurRadius: 20,
    offset: Offset(0, 10));
BoxShadow kDepthShadow = BoxShadow(
    blurRadius: 30,
    offset: Offset(0, 10),
    color: Colors.black.withOpacity(0.3));

TextStyle kSubHeadTextStyle = TextStyle(color: Color(0xFF1C1C1D), fontSize: 18);
TextStyle kDescTextStyle = kSubHeadTextStyle.copyWith(
                                    fontSize: 15, color: Colors.black.withOpacity(0.7));

TextStyle kHeadTextStyle = TextStyle(
    fontSize: 27, fontWeight: FontWeight.w600, color: Color(0xFF0E0F13));
