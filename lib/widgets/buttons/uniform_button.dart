import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';

class UniformButton extends StatelessWidget {
  UniformButton({this.child, this.bgColor, this.onPressed});

  final Widget? child;
  final Color? bgColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor!=null?bgColor:kMainAccentColor,
          boxShadow: [kSubtleShadow],
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        height: 50,
        width: double.maxFinite,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
