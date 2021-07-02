import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';
import 'package:hhw/creation_of_universe.dart';
import 'package:hhw/maharishi_pingalacharya.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/uniform_screens_temp.dart';

class RigVedaScreen extends StatelessWidget {
  final int index = 0;
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
                    "The Rig Ved is the oldest vedas containing a wealth of knowledge about a variety of subjects. Some of those topics however do relate to Mathematics and that's what we'll see in this app.\nNote - 'This only offers a small fraction of information of what the Vedas offers... Kindly read the original document if u want to recieve an actually considerable amount of knowledge'."),
            Text(
              'The creation of Universe',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            PageRouteButton(
              title: 'Nasadiya Sutra',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NasadiyaSuktaPage()));
              },
            ),
            SizedBox(height: 30),
            buildDataTile(
              title: 'Errors and diagnosis',
              description:
                  "The Rig Veda was recited using a special method of recitation which is taking into account to modern error correction and detection algorithms. The Maharishis developed this system to calculate the error in chanting of mantras and the pronounciation of different syllables.\n\n     For illustration, consider one half of the famous gayatri mantra of the seer Vishvamitra. The standard method of recitation involving conjunction is called Samhita patha (given below).\n\nSamhita Patha\ntatsaviturvarenyam	bhargo	devasya	dhimahi\nSeparate all compound words into their constituents and number the words:\n\ntat	savituh	varenyam	bhargah	devasya	dhimahi\n  1    	  2	               3	               4            	5\n       6\n\nIn the kramapatha chant, use a text obtained by combining two neighboring words according the rules of sandhi, resulting in six words.\n1+2	2+3	3+4	4+5	5+6	6+6\n\nKrama Patha\nA Krama patha expert chants the krama-version of all the verses.\nTo understand its error detecting capability, divide the chant into syllables so that the syllable ends with an vowel a, i, u etc. Both the third syllable and sixth syllables are same namely vi. Suppose we commit an error and chant the third syllable as va. According to the krama chanting, the sixth syllable should be same as the third syllable. He would pronounce it as vi, since we are assuming he will make only one error. Then he notices that an error has taken place since va is different from vi. An error has obviously occurred, but he does not know which is correct, va or vi? There are other methods which detect these errors and also methods that show how to correct them.The various forms of chanting are called as vikratis and there are eight of them",
            ),
            Text(
              'Binary Number System',
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            PageRouteButton(
              title: 'Chhand Sutras',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PingalaChhandSutrasScreen()));
              },
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

class PageRouteButton extends StatelessWidget {
  PageRouteButton({required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kMainAccentColor,
              boxShadow: [kSubtleShadow],
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              title,
              style:
                  kSubHeadTextStyle.copyWith(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kMainAccentColor,
              boxShadow: [kSubtleShadow],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
