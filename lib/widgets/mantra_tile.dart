import 'package:flutter/material.dart';
import '../constants.dart';

Widget buildMantraTile({
  required String title,
  required String description,
  required String mantra,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: kSubHeadTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w700)),
      SizedBox(height: 20),
      // SizedBox(height: 10),
      // Text(
      //   '\'Sankhya\' is a very important algorithm given by Pingalacharya. In the modern world its used to convert numeral units from binary to hexadecimal.',
      //   style: kDescTextStyle,
      // ),
      MantraTile(mantra),
      SizedBox(height: 10),
      Text(
        description,
        style: kDescTextStyle,
      ),
      SizedBox(height: 30),
    ],
  );
}

class MantraTile extends StatelessWidget {
  MantraTile(this.mantra);
  final String mantra;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: kMainAccentColor,
        boxShadow: [kSubtleShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Text(mantra,
              style: kSubHeadTextStyle.copyWith(
                  fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}
