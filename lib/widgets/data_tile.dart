import 'package:flutter/material.dart';
import '../constants.dart';

Widget buildDataTile({required String title, required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title,
          style: kSubHeadTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w700)),
      SizedBox(height: 20),
      Text(
        description,
        style: kDescTextStyle,
      ),
      SizedBox(height: 30),
    ],
  );
}
