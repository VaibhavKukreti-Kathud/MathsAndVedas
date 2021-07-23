import 'package:flutter/material.dart';
import 'package:hhw/combinatorics.dart';
import 'package:hhw/vedas_screens/rig_ved.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/uniform_screens_temp.dart';

class SamaVedaScreen extends StatelessWidget {
  final int index = 2;
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
                    'The Sama Veda is a collection of melodies. The hymns in the Sama Veda, used as musical notes, are drawn from the Rig Veda and have no distinctive lessons of their own. As vedic scholar David Frawley says, “If the Rig Veda is the word, Sama Veda is the song or the meaning, if Rig Veda is the knowledge, Sama Veda is its realisation, if Rig Veda is the wife, the Sama Veda is her husband”.'),
            buildDataTile(
                title: 'Relation with Maths',
                description:
                    'The Veda contains hymns that praise gods. The hymns in these vedas are very special and unique in various ways. The shlokas in the Sama Veda are needed to be pronounced accuratly for them to work. For this there were many works given by great rishis. One of them being Maharishi Pingalacharya. He gave his works upon Combinatorics and formulas to calculate the number of different ways any task can be done'),
            PageRouteButton(
                title: 'Combinatorics',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CombinatoricsScreen()));
                }),
            SizedBox(height: 70),
          ],
        ));
  }
}
