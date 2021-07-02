import 'package:flutter/material.dart';
import '../constants.dart';

class UniformButton extends StatelessWidget {
  UniformButton({required this.onPressed, required this.icon});
  final Function onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
          padding: EdgeInsets.all(15),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius)),
          child: icon),
    );
  }
}
