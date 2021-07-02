import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/info_page_temp.dart';
import 'package:hhw/widgets/mantra_tile.dart';

class NasadiyaSuktaPage extends StatelessWidget {
  const NasadiyaSuktaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UniformInfoScreen(
      title: 'Nasadiya Suktas',
      data: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0),
          Text('Nasadiya Sukta', style: kHeadTextStyle),
          SizedBox(height: 20),
          Text(
            'Meaning',
            style: kSubHeadTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text(
            "The Nāsadīya Sūkta (after the incipit ná ásat, or \"not the non-existent\"), also known as the Hymn of Creation, is the 129th hymn of the 10th mandala of the Rigveda . It is concerned with cosmology and the origin of the universe.",
            style: kDescTextStyle,
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                image: DecorationImage(
                    image: AssetImage('assets/brahmanda.png'),
                    fit: BoxFit.cover)),
          ),SizedBox(height: 10),
          buildDataTile(
              title: 'Theory of Multiverse',
              description:
                  'According to the Rig Veda, there are \'anant\' Universes that all repeat the same cycle of creation and demolition. The word "brahmanda" means \'brahma - Literally everything\',\'anda - egg\'. Which means the shape of the whole universe is in the shape of an egg, and there are infite of these eggs all emergin from "Mahavishnu" which means the cosmological fluid containing these egg like brahmands. In the picture given above, Mahavishnu is personified into a human form. Whilst, according to the vedas, He/She has no form... and is genderless(neither male, nor female,and not anything falling in between)'),
          SizedBox(height: 20),
          buildMantraTile(
              title: 'The before',
              description:
                  'Then even non-existence was not there, nor existence,there was no air then, nor the space beyond it. What covered it? Where was it? In whose keeping? Was there then cosmic fluid, in depths unfathomed?',
              mantra:
                  'नासदासीन्नो सदासीत्तदानीं नासीद्रजो नो व्योमा परो यत् |\nकिमावरीवः कुह कस्य शर्मन्नम्भः किमासीद्गहनं गभीरम् ॥'),
          buildMantraTile(
              title: 'What the creation replaced?',
              description:
                  '\nMeaning: The number of metres of n-syllables is\nSn= 2^n\nPingala gives an optimal algorithm for ﬁnding 2^n by means ofmultiplication and squaring operations that are much less than in number.',
              mantra:
                  'तम आसीत्तमसा गूहळमग्रे प्रकेतं सलिलं सर्वाऽइदम् |\nतुच्छ्येनाभ्वपिहितं यदासीत्तपसस्तन्महिनाजायतैकम् ॥'),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
