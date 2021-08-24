import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hhw/maharishi_pingalacharya.dart';
import 'package:hhw/main.dart';
import 'package:hhw/models/vedas_list.dart';
import 'package:hhw/widgets/youtube_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.controller});
  final PersistentTabController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBGColor,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vedas and',
                                  style: kHeadTextStyle.copyWith(
                                      color: Colors.black38,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Mathematics',
                                  style: kHeadTextStyle,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.jumpToTab(2);
                              },
                              onLongPress: () {
                                Vibrate.vibrateWithPauses(
                                    Iterable.generate(10, (r) {
                                  return Duration(milliseconds: 50);
                                }));
                                _showDaanav(context);
                              },
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 48, bottom: 30),
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [kSubtleShadow],
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius)),
                                    child: Text(
                                      'Hi, Vaibhav',
                                      style: kSubHeadTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ),
                                  Hero(
                                    tag: 'dp',
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundImage:
                                          AssetImage('assets/dp.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                      SizedBox(height: 30),
                      _buildSearchBar(),
                      SizedBox(height: 30),
                      Text(
                        'Topics to read',
                        style: kSubHeadTextStyle,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      buildTopicButton(context),
                      buildTopicButton(context),
                      buildTopicButton(context),
                      buildTopicButton(context),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'The Vedas',
                    style: kSubHeadTextStyle,
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                    child: Stack(children: [
                  _buildVedasScrollList(context),
                  IgnorePointer(
                    ignoring: true,
                    child: Transform.translate(
                      offset: Offset(0, -1),
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              kMainBGColor,
                              kMainBGColor.withOpacity(0)
                            ],
                                stops: [
                              0,
                              1
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                    ),
                  )
                ])),
              ],
            ),
            IgnorePointer(
              ignoring: true,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 74,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [kMainBGColor, kMainBGColor.withOpacity(0)],
                          stops: [0.64, 1],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PersistentBottomSheetController<dynamic> _showDaanav(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomSheet(
                onClosing: () {
                  Navigator.pop(context);
                },
                enableDrag: true,
                backgroundColor: kMainAccentColor,
                builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    )),
          );
        });
  }

  Widget _buildVedasScrollList(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AspectRatio(
              aspectRatio: 2 / 1.3,
              child: Row(
                children: [
                  Expanded(
                    child: _buildVedasTile(0, context),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildVedasTile(1, context),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            AspectRatio(
              aspectRatio: 2 / 1.3,
              child: Row(
                children: [
                  Expanded(
                    child: _buildVedasTile(2, context),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildVedasTile(3, context),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Text(
                'Relevant videos',
                style: kSubHeadTextStyle,
              ),
            ),
            SizedBox(height: 10),
            YoutubePlayer('V7N2CXdSqks'),
            SizedBox(height: 15),
            YoutubePlayer('eQqJkm_q93k'),
            SizedBox(height: 15),
            YoutubePlayer('S1-17TeZvV0'),
            SizedBox(height: 80),
          ])),
    );
  }

  Widget _buildSearchBar() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            boxShadow: [kSubtleShadow],
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: Colors.white),
        child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: kMainAccentColor,
                ),
                icon: Icon(
                  Icons.search,
                ),
                hintText: 'Search here',
                hintStyle: kSubHeadTextStyle.copyWith(
                    color: Colors.black.withOpacity(0.1), fontSize: 18))));
  }

  Widget buildTopicButton(_) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            _, MaterialPageRoute(builder: (_) => PingalaChhandSutrasScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: kMainAccentColor,
            boxShadow: [
              BoxShadow(
                  color: kMainAccentColor.withOpacity(0.6),
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ],
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: Text(
          'Pascal\'s Triangle',
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
        ),
      ),
    );
  }
}

Widget _buildVedasTile(int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      vibrateTap();
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => vedaMaterialsList[index].page));
    },
    child: Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: Colors.white,
            boxShadow: [kSubtleShadow],
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 72,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            vedaMaterialsList[index].name,
                            style: kSubHeadTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                                fontSize: 18),
                          ),
                          Text(
                            'Topics',
                            style: kSubHeadTextStyle.copyWith(
                                fontSize: 14, color: Colors.black45),
                          ),
                        ]),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    vedaMaterialsList[index].info,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        wordSpacing: 0.1,
                        letterSpacing: 0.01),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 15,
          child: SizedBox(
            height: 120,
            width: 80,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  boxShadow: [
                    BoxShadow(
                        color: vedaMaterialsList[index].color.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(10, 10))
                  ]),
              child: Hero(
                tag: vedaMaterialsList[index].imagePath,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Image.asset(
                    vedaMaterialsList[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
