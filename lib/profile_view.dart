import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hhw/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/custom_clipper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  void _vibrate() {
    Vibrate.feedback(FeedbackType.medium);
  }

  void _launchURL(url) async {
    _vibrate();
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: kMainBGColor,
        body: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipPath(
              child: Container(color: kMainAccentColor),
              clipper: GetClipper(),
            ),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, boxShadow: [kDepthShadow]),
                      child: Hero(
                        tag: 'dp',
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/dp.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          boxShadow: [kSubtleShadow],
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Text(
                            'Vaibhav Kukreti',
                            style: kHeadTextStyle.copyWith(
                                fontSize: 23,
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'XII Science',
                            style: kSubHeadTextStyle.copyWith(
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 20,
                                  offset: Offset(0, -10))
                            ],
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            color: Colors.white),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            SizedBox(height: 20),
                            Text('Sources to all the information',
                                style: kSubHeadTextStyle),
                            SizedBox(height: 10),
                            _buildSourceTile(() {
                              _launchURL('https://www.google.com');
                            }, "The source of information about the Vedas you see on the app"),
                            _buildSourceTile(() {
                              _launchURL('https://www.google.com');
                            }, "The source of information about the Binomial Theorem you see on the app"),
                            _buildSourceTile(() {
                              _launchURL('https://fdocuments.in/embed/v1/05-pingala-mds.html');
                            }, "The source of information about the Binary number system you see on the app"),
                            _buildSourceTile(() {
                              _launchURL('https://www.google.com');
                            }, "The source of information about the Speech Recognition and Sanskrit you see on the app"),
                            _buildSourceTile(() {
                              _launchURL('https://www.google.com');
                            }, "The source of information about Pi(π)you see on the app"),
                            SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            kMainBGColor,
                            Colors.white.withOpacity(0)
                          ],
                              stops: [
                            0.52,
                            1
                          ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget _buildSourceTile(Function() onPressed, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        splashColor: kMainAccentColor,
        onTap: onPressed,
        child: Column(
          children: [
            Text(title,
                style: kSubHeadTextStyle.copyWith(
                    fontSize: 15, color: Colors.black54)),
            SizedBox(height: 7),
            Row(
              children: [
                Text("Learn more",
                    style: kSubHeadTextStyle.copyWith(
                        fontSize: 12, color: Colors.blueAccent)),
                SizedBox(width: 10),
                Icon(
                  Icons.open_in_new_rounded,
                  size: 15,
                  color: Colors.blueAccent,
                )
              ],
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Divider(
                height: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}


