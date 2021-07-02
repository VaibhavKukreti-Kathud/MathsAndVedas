import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:hhw/constants.dart';

class SwitchButton extends StatelessWidget {
  SwitchButton(this.title, this.enabled);

  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: kSubHeadTextStyle,
          ),
          Spacer(),
          AdvancedSwitch(
            enabled: enabled,
            controller: AdvancedSwitchController(enabled),
            width:50,
            height: 30,
            borderRadius: BorderRadius.circular(18),
          ),
        ],
      ),
    );
  }
}
