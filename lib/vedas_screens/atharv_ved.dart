import 'package:flutter/material.dart';
import 'package:hhw/vedas_screens/rig_ved.dart';
import 'package:hhw/widgets/data_tile.dart';
import 'package:hhw/widgets/uniform_screens_temp.dart';
import 'package:url_launcher/url_launcher.dart';

class AtharvVedaScreen extends StatelessWidget {
  final int index = 3;
  @override
  Widget build(BuildContext context) {
    return UniformVedaScreen(
        index: index,
        data: Column(
          children: [
            buildDataTile(
              title: 'The "Vedic Maths"',
              description:
                  'The so called "Vedic Maths" popular in the modern world emerged from Atharva veda, This veda consisted of elementry maths like;\n1*1 = 1,\n1/1 = 1,\n\nThis veda also included the most efficient algorithms till date to perform basic square roots, squares, division, multiplication which were re-discovered by Sri Bharati Krisna Tirthaji(1884-1960)',
            ),
            buildDataTile(
              title: 'Geometric algorithms',
              description:
                  'This veda also contained algorithms to solve\nlinear equations,\nanalytic conics,\nequations for asymptotes,\nand the equations for conjugate parabolas',
            ),
            PageRouteButton(
                title: 'Solving Linear Equations',
                onPressed: () {
                  launch(
                      'https://www.researchgate.net/profile/Krutika-Sapkal/publication/301197675_Solving_Linear_Equations_Using_Vedic_mathematical_Approach_on_Parallel_Platform/links/571079db08ae68dc79097687/Solving-Linear-Equations-Using-Vedic-mathematical-Approach-on-Parallel-Platform.pdf');
                }),
            SizedBox(height: 10),
            PageRouteButton(
                title: 'Learn about pythagoras theorem',
                onPressed: () {
                  launch(
                      'https://www.researchgate.net/profile/Krutika-Sapkal/publication/301197675_Solving_Linear_Equations_Using_Vedic_mathematical_Approach_on_Parallel_Platform/links/571079db08ae68dc79097687/Solving-Linear-Equations-Using-Vedic-mathematical-Approach-on-Parallel-Platform.pdf');
                }),
            SizedBox(height: 30),
            buildDataTile(
              title: 'Concept of Zero/Null/Void',
              description:
                  'The concept of Shunya, or zero void, was originally conceived as the symbol of Brahman, expressing the sum of all distinct forms. The symbol of zero and the decimal system of notation is described in the Atharvaveda. it describes how the number increases by 10 by writing zero in front of it. While there is no explicit mention of zero, it must have been common knowledge based on how it is used.\n\nIn fact, the concept of shunya was not just mathematical or scientific, but is deeply rooted in all branches of thought - especially metaphysics and cosmology. Shunya is the transition point between oposites, it symboliss the real balance between divergent tendencies. Most ancient mathematicians defined zero as the sum of two equal and opposite quantities. Zero produces all figures, but is itself not limited to a certain value. Zero is the primary or final reservoir of all single numbers. The symbol of zero and the decimal system of notation is described in the Atharvaveda. It describes how the number increases by 10 by writing zero in front of it.',
            ),
            SizedBox(height: 70)
          ],
        ));
  }
}
