import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/image_view.dart';
import 'package:hhw/widgets/info_page_temp.dart';

class CombinatoricsScreen extends StatelessWidget {
  const CombinatoricsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UniformInfoScreen(
      title: 'Combinatorics',
      data: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0),
          Text('Combinatorics', style: kHeadTextStyle),
          SizedBox(height: 30),
          buildDataTile(
              title: 'About',
              description:
                  'The chhand sutras were written by The Great, Maharishi Pingalacharya. He gave algorithms to calculate thenumber of ways a word can be written depending on the syllables it had named \'Gurus\' and \'Laghus\'.'),
          Text(
            'Pingala\'s formula',
            style: kSubHeadTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => IsolatedImageView(
                          imagePath: 'assets/pingala_2_power_n.png')));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Container(
                  height: 169,
                  child: Image.asset('assets/pingala_2_power_n.png',
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Note that the L and G here, denote the 'Guru'/s and 'Laghu'/s",
            style: kDescTextStyle,
          ),
          SizedBox(height: 20),
          Text(
            'Modern day formula',
            style: kSubHeadTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => IsolatedImageView(
                          imagePath: 'assets/2_power_n_english.png')));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Container(
                  height: 169,
                  child: Image.asset('assets/2_power_n_english.png',
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Note that the formula given by respected Gottfried Leibniz (2^n) is the same formula given by Maharishi Pingalacharya in the Vedic Ages! It's just that we need to decode all the formulas which he wrote in sutras(mantra/shlok) form.",
            style: kDescTextStyle,
          ),
          SizedBox(height: 20),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
