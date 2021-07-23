import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhw/constants.dart';
import 'package:hhw/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.amber,
          primaryColor: kMainAccentColor,
          backgroundColor: kMainBGColor,
          accentColor: kMainAccentColor,
        ),
        home: Dashboard());
  }
}

void vibrateMed() {
  Platform.isIOS || Platform.isAndroid
      ? Vibrate.feedback(FeedbackType.medium)
      : null;
}

void vibrateTap() {
  Platform.isIOS || Platform.isAndroid
      ? Vibrate.feedback(FeedbackType.selection)
      : null;
}
