import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hhw/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';
import 'package:flutter/foundation.dart';

class YoutubePlayer extends StatefulWidget {
  final String videoID;
  YoutubePlayer(this.videoID);
  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Vibrate.feedback(FeedbackType.impact);
        _showDialog(
          context,
          widget.videoID,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) {
                  if (kIsWeb && constraints.maxWidth > 800) {
                    return Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: new Image.network(
                          YoutubePlayerController.getThumbnail(
                              videoId: widget.videoID,
                              // todo: get thumbnail quality from list
                              quality: ThumbnailQuality.max),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width * 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: new CachedNetworkImage(
                          imageUrl: YoutubePlayerController.getThumbnail(
                              videoId: widget.videoID,
                              quality: ThumbnailQuality.max,
                              webp: false),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(0, 10),
                      color: Colors.black.withOpacity(0.4))
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius + 100),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white.withOpacity(0.6),
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(context, videoID) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return YoutubeViewer(
          videoID,
        );
      },
    );
  }
}

class YoutubeViewer extends StatefulWidget {
  final String? videoID;
  YoutubeViewer(this.videoID);
  @override
  _YoutubeViewerState createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID!, // livestream example
      params: YoutubePlayerParams(
        //startAt: Duration(minutes: 1, seconds: 5),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        autoPlay: true,
        enableCaption: true,
        showVideoAnnotations: false,
        enableJavaScript: true,
        privacyEnhanced: true,
        useHybridComposition: true,
        playsInline: false,
      ),
    )..listen((value) {
        print(_controller.value.position);

        if (value.isReady && !value.hasPlayed) {
          _controller
            ..hidePauseOverlay()
            ..hideTopMenu()
            ..play();
        }
        if (value.hasPlayed) {
          _controller..hideEndScreen();
        }
      });

    _controller.onExitFullscreen = () {};
  }

  @override
  Widget build(BuildContext context) {
    final player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      key: UniqueKey(),
      controller: _controller,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderRadius))),
          insetPadding: EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          content: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: player),
          contentPadding: EdgeInsets.all(0),
          actions: <Widget>[
            TextButton(
              child: Center(
                  child: new Text(
                "Close",
                style: kSubHeadTextStyle.copyWith(
                    color: kMainAccentColor, fontSize: 15),
              )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Center(
                  child: new Text(
                "Open video in YouTube",
                style: kSubHeadTextStyle.copyWith(
                    color: kMainAccentColor, fontSize: 15),
              )),
              onPressed: () {
                launch("https://youtu.be/${_controller.initialVideoId}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
