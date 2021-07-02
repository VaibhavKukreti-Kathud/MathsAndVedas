import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';

class DropDownField extends StatefulWidget {

  DropDownField({required this.itemList, required this.onValuePicked, required this.initDropdownValue});

  final List<String> itemList;
  final Function(String region) onValuePicked;
  final String initDropdownValue;

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: widget.initDropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      dropdownColor: Colors.white,
      onChanged: (String? newValue) {
        setState(() {
          widget.onValuePicked(newValue!);
        });
      },
      underline: SizedBox(),
      items: widget.itemList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: kSubHeadTextStyle,
          ),
        );
      })
          .toList(),
    );
  }
}
