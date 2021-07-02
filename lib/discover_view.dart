import 'package:flutter/material.dart';
import 'package:hhw/widgets/youtube_widget.dart';
import 'constants.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({Key? key}) : super(key: key);
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
                icon: Icon(Icons.search),
                hintText: 'Search here',
                hintStyle: kSubHeadTextStyle.copyWith(
                    color: Colors.black26, fontSize: 18))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainBGColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _buildSearchBar(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text('Discover', style: kSubHeadTextStyle),
                            ),
                            SizedBox(height: 10),
                            _buildVideoContainer('V7N2CXdSqks',
                                'How is Sanskrit related to Machine Learning and AI?'),
                            _buildVideoContainer('eQqJkm_q93k',
                                'Some untold mystreys about sanskrit and its relation with Computing!'),
                            _buildVideoContainer('S1-17TeZvV0',
                                'A breif introduction to the history of Vedas.'),
                            _buildVideoContainer('s723-3hkUjA',
                                'A breif explaination of Geometry as descrobed by the Vedas.'),
                            _buildVideoContainer('QzAub_EjkZU',
                                'The foundation of Astronomical Physics as given by Aryabhatta.'),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: Transform.translate(
                            offset: Offset(0, -1),
                            child: Container(
                              height: 30,
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
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: Container(
                            height: 74,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  kMainBGColor,
                                  kMainBGColor.withOpacity(0)
                                ],
                                    stops: [
                                  0.33,
                                  0.8
                                ],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   decoration: BoxDecoration(
              //       boxShadow: [kSubtleShadow],
              //       borderRadius: BorderRadius.circular(kBorderRadius),
              //       color: Colors.white),
              //   child: Column(
              //     children: [
              //       _buildSearchSuggestions('The Sama Veda'),
              //       _buildSearchSuggestions('Maharishi Pingalacharya'),
              //       _buildSearchSuggestions('The Rig Veda'),
              //       _buildSearchSuggestions('The Yajur Veda'),
              //       _buildSearchSuggestions('The Atharv Veda'),
              //       Container(
              //           height: 25,
              //           margin: EdgeInsets.symmetric(vertical: 5),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('See more',
              //                   style: TextStyle(
              //                       color: kMainAccentColor.withOpacity(0.8))),
              //               Icon(
              //                 Icons.arrow_downward_rounded,
              //                 color: kMainAccentColor,
              //                 size: 15,
              //               ),
              //             ],
              //           )),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoContainer(String url, String title) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(kBorderRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: Offset(0, 5))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(url),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                title,
                style: kSubHeadTextStyle,
              ),
            )
          ],
        ));
  }

//   Widget _buildSearchSuggestions(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//             child: Text(
//               title,
//               style: kSubHeadTextStyle.copyWith(
//                   color: Colors.black87, fontSize: 16),
//             )),
//         Icon(Icons.trending_up_rounded,
//             size: 20, color: Colors.blueAccent.shade200)
//       ],
//     );
//   }
}
