import 'package:flutter/material.dart';
import 'package:hhw/vedas_screens/rig_ved.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/mantra_tile.dart';
import 'package:hhw/widgets/uniform_screens_temp.dart';

import '../constants.dart';

class YajurVedaScreen extends StatelessWidget {
  final int index = 1;
  @override
  Widget build(BuildContext context) {
    return UniformVedaScreen(
        index: index,
        data: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDataTile(
                title: 'Introduction',
                description:
                    "The Yajurveda is second of the four Vedas, the basic scriptures of the religion. It is often called as Adhvaryuveda, since it's main use is in the performance of the Vedic sacrifices where the adhvaryu is the chief priest under whose direct guidance the entire sacrifice is performed. Its mantras are called yajus. These mantras are in Yajus."),
            buildDataTile(
                title: 'Big numbers',
                description:
                    'In Yajurveda, numbers starting from four and with a difference of four forming an arithmetic series is discussed. The Yajurveda also mentions the counting of numbers upto 10^18, the highest being named parardha.\n\nIn the Taittiriya Upanishad, there is a anuvaka (section), that extols the "Beatific Calculus" or a quasi-mathematical relationship between bliss of a young man, who has everything in the world to the bliss of the Brahman, or "realization". Translated roughly as follows, fear is all-pervasive. It continues by assuming that a young, good man who is fit, healthy and strong, and has all the wealth in the world, is one unit of human bliss. The anuvaka provides a precise calculation of a series of multiplications by 10^0 to give number 10^010 units of human bliss that can be had when one attains Brahman. The previous anuvaka exhorts the aspirants to be fearless and strong, as only such a person may realize the absolute within.\n\n"Satam (10^2 = hundred)),\nSahasram (10^3 = Thousand),\nAyutam (10^4 = ten thousand),\nNiyutam (10^5 = hundred thousand = one lakh),\n Paryutam (10^6 = million = ten lakh),\nArbuda (10^7 = ten million),\nNyarbuda (10^8 = hundred million),\nSamudra (10^9 = Billion),\n Madhya (10^10 = ten Billion),\nAnta (10^11 = hundred Billion)\nand Parartha (10^12 = One Trillion), The largest number according to the Vedas"'),
            buildMantraTile(
              title: 'Concept of Infinity',
              description:
                  "This concept confuses many people till date when people in the Vedic Age were already aware of it. Usually people think of infinity as the largest number. Although it's not wrong.. it is definately not correct to the fullest extent. Yajur Veda puts the concept of infinity in a very easy to grasp way. According to the shloka given above,\n\nFrom infinity is born infinity.\nWhen infinity is taken out of infinity,\nonly infinity is left over.",
              mantra:
                  'पूर्णमदः पूर्णमिदं पूर्णात्पूर्णमुदच्यते ।\nपूर्णस्य पूर्णमादाय पूर्णमेवावशिष्यते ॥',
            ),
            Text(
              'Binary Number System',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            PageRouteButton(
              title: 'Chhand Sutras',
              onPressed: () {},
            ),
            SizedBox(height: 30),
            Text(
              'Usage of Pi(π)',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Text(
              "Rig Veda was the first scripture ever to measure the area of a circle with the formula we still use today that is π(d/2)^2.",
              style: kDescTextStyle,
            ),
            SizedBox(height: 10),
            Container(
              height: 129,
              margin: EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: Colors.white,
                boxShadow: [kSubtleShadow],
                image: DecorationImage(
                    image: AssetImage('assets/pi.png'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "The modern mathematics calls this series Gregory Series but this was written in at around 14th century",
              style: kDescTextStyle,
            ),
            SizedBox(height: 30),
            Text(
              'Here\'s where this information comes from',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Container(
              height: 195,
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: Colors.white,
                boxShadow: [kSubtleShadow],
                image: DecorationImage(
                    image: AssetImage('assets/rig_ved.png'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 40),
          ],
        ));
  }
}
