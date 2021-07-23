import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';
import 'package:hhw/vedas_screens/rig_ved.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/image_view.dart';
import 'package:hhw/widgets/info_page_temp.dart';
import 'package:hhw/widgets/mantra_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class PingalaChhandSutrasScreen extends StatelessWidget {
  const PingalaChhandSutrasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UniformInfoScreen(
        data: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            Text('Chhand Sutra', style: kHeadTextStyle),
            SizedBox(height: 20),
            buildDataTile(
                title: 'About',
                description:
                    'THe chhand sutras were written by The Great, Maharishi Pingalacharya. He gave algorithms to encode and decode words and numbers in binary number system because he could see the future moving towards computing and computers that\d only understand binary system.'),
            Text(
              'Pingala\'s 6 algorithms',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              "- Prastara\n- Nashtam\n- Uddhishtam\n- Lagakriya\n- Sankhya\n- Adhvayoga",
              style: kDescTextStyle,
            ),
            SizedBox(height: 20),
            Text(
              'Binary decoding and encoding',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              "This techinique uses one of the six of Pingala's Algorithm. Namely 'Sankhya'.\nExample:\nSix-syllable metres (n= 6)\n6/2= 3 and mark “2”\n3 cannot be halved.\n3-1=2 and mark “0”\n2/2= 1 and mark “2”\n1 − 1 = 0 and mark “0”\nSequence 2, 0, 2, 0 yields\n1x2, (1x2)^2, ((1x2)^2)x2, (((1x2)^2)x2)^2= 2^6",
              style: kDescTextStyle,
            ),
            SizedBox(height: 20),
            buildMantraTile(
                title: 'Saankhya',
                description:
                    '\nMeaning: The number of metres of n-syllables is\nSn= 2^n\nPingala gives an optimal algorithm for ﬁnding 2^n by means ofmultiplication and squaring operations that are much less than in number.',
                mantra:
                    'द्विरर्धे। रूपे शून्यम्। द्विःशून्ये। तावदर्धे तद्गुणितम्।'),
            Text(
              'Lagakriya',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              "Step 1:",
              style: kDescTextStyle,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => IsolatedImageView(
                            imagePath: 'assets/lagakriya1.png')));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Container(
                    height: 169,
                    child: Image.asset('assets/lagakriya1.png',
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Step 2:",
              style: kDescTextStyle,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => IsolatedImageView(
                            imagePath: 'assets/lagakriya2.png')));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Container(
                    height: 182,
                    child: Image.asset('assets/lagakriya2.png',
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "This is exactly what is referred to as the Pascal's Triangle in today's date. This was given by Maharishi Pingalacharya approximately at the time of formation of the Rig Veda. It's purpose is discussed in the picture below: ",
              style: kDescTextStyle,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => IsolatedImageView(
                            imagePath: 'assets/lagakriya3.png')));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Container(
                    height: 187,
                    child: Image.asset('assets/lagakriya3.png',
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 10),
            PageRouteButton(
                title: 'More about Pascal\'s Triangle',
                onPressed: () {
                  launch('https://youtu.be/eQqJkm_q93k?t=1366');
                }),
            SizedBox(height: 70),
          ],
        ),
        title: 'Chhand Sutras');
  }
}
