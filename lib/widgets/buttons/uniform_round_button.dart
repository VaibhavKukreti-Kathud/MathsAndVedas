import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';

import '../buttons.dart';

class RoundedUniformButton extends StatelessWidget {
  RoundedUniformButton(this.action);

  final Function action;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: UniformButton(
          onPressed: action,
           icon: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: kSubHeadTextStyle.color,
        )));
  }
}