import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hhw/widgets/custom_clipper.dart';
import 'package:share/share.dart';
import '../constants.dart';
import 'buttons.dart';

class UniformInfoScreen extends StatelessWidget {
  UniformInfoScreen({required this.data, required this.title});
  final Widget data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Container(
              decoration: BoxDecoration(
                color: kMainBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius + 20),
                  topRight: Radius.circular(kBorderRadius + 20),
                ),
              ),
              margin: EdgeInsets.only(top: 110),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius + 20),
                    topRight: Radius.circular(kBorderRadius + 20),
                  ),
                  child: Stack(
                    children: [
                      ClipPath(
                        child: Container(color: kMainAccentColor),
                        clipper: GetClipper(),
                      ),
                      buildScrollDiscText(context, data),
                    ],
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UniformButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kMainAccentColor,
                  ),
                ),
                Text(
                  title,
                  style: kSubHeadTextStyle.copyWith(color: Colors.white),
                ),
                UniformButton(
                  onPressed: () {
                    Share.share(
                        'Hey! look what I found on the Vedas and Mathematics app... Be sure to check it out');
                  },
                  icon: Icon(
                    Icons.ios_share_outlined,
                    color: kMainAccentColor,
                  ),
                ),
              ],
            ),
          ),
          Transform(
            transform: Matrix4(
              1,0,0,0,
              0,1,0,0,
              0,0,1,0,
              0,0,0,1,
            )..rotateX(pi)..rotateY(pi)..rotateZ(pi),
            child: IgnorePointer(
              ignoring: true,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [kMainBGColor, kMainBGColor.withOpacity(0)],
                          stops: [0.52, 1],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

CustomScrollView buildScrollDiscText(BuildContext context, Widget data) {
  return CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
    SliverList(
        delegate: SliverChildListDelegate([
      Stack(fit: StackFit.passthrough, children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: data)
      ])
    ]))
  ]);
}
