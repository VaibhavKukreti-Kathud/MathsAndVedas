import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';

class RoundTextField extends StatelessWidget {
  RoundTextField(
      {this.title, required this.hintText, required this.onChanged, this.controller});
  final String? title;
  final Function onChanged;
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            title!,
            style: kSubHeadTextStyle.copyWith(
                color: Colors.white54,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        )
            : SizedBox(height: 0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Color(0xFF2F2F3B),
                borderRadius: BorderRadius.circular(kBorderRadius)),
            child: TextFormField(
              onChanged: (value) => onChanged(value),
              style: kSubHeadTextStyle,
              scrollPhysics: BouncingScrollPhysics(),
              cursorColor: kMainAccentColor,
              controller: this.controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: kSubHeadTextStyle.copyWith(
                    color: Colors.white.withOpacity(0.2)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}