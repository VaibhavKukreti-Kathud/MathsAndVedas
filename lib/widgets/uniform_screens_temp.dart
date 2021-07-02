import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hhw/models/vedas_list.dart';
import 'package:hhw/widgets/custom_clipper.dart';
import 'package:share/share.dart';
import '../constants.dart';
import 'buttons.dart';

class UniformVedaScreen extends StatelessWidget {
  UniformVedaScreen({required this.index, required this.data});
  final Widget data;
  final int index;

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
                      buildScrollDiscText(context, index, data),
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
                  vedaMaterialsList[index].title,
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
          Align(
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
        ],
      ),
    );
  }
}

CustomScrollView buildScrollDiscText(
    BuildContext context, int index, Widget data) {
  return CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
    SliverList(
        delegate: SliverChildListDelegate([
      Stack(fit: StackFit.passthrough, children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [kSubtleShadow],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  child: Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.of(context).size.width - 230),
                        child: AspectRatio(
                          aspectRatio: 2 / 3.2,
                          child: Hero(
                            tag: vedaMaterialsList[index].imagePath,
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                                child: Image.asset(
                                  vedaMaterialsList[index].imagePath,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vedaMaterialsList[index].name,
                                style:
                                    kHeadTextStyle.copyWith(fontSize: 28),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'It includes the following topics',
                                style: kHeadTextStyle.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14),
                              ),
                              Divider(),
                              Text(
                                vedaMaterialsList[index].info,
                                style: kHeadTextStyle.copyWith(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                data
              ],
            ))
      ])
    ]))
  ]);
}
