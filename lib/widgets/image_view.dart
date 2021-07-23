import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';

class IsolatedImageView extends StatelessWidget {
  IsolatedImageView({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.white,
            child: Container(
                decoration: BoxDecoration(boxShadow: [kSubtleShadow]),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                )),
          ),
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            color: kMainAccentColor)),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [kSubtleShadow],
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Icon(Icons.ios_share_rounded,
                          color: kMainAccentColor)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
