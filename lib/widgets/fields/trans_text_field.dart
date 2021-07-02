import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hhw/constants.dart';

class TransTextField extends StatefulWidget {
  TransTextField(
      {this.controller, this.hintText, this.errorText, this.icon, this.obscureText = false, this.keyboardType, this.inputAction, this.focusNode, this.onEditingComplete, this.onChange, this.enabled});

  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool? enabled;
  final Widget? icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final Function? onEditingComplete;
  final void Function(String value)? onChange;

  @override
  _TransTextFieldState createState() => _TransTextFieldState();
}

class _TransTextFieldState extends State<TransTextField> {
  bool _passwordVisible = false;

  void _onChange(String value) {
    if (widget.onChange != null) {
      widget.onChange!(value);
    }
  }

  @override
  void initState() {
    _passwordVisible = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => _onChange(value),
      controller: widget.controller,
      cursorRadius: Radius.circular(10),
      obscureText: _passwordVisible,
      cursorColor: Colors.white70,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      style: kSubHeadTextStyle,
      keyboardType: widget.keyboardType,
      textInputAction: widget.inputAction,
      focusNode: widget.focusNode,
      onEditingComplete: () {
        widget.onEditingComplete!();
      },
      enabled: widget.enabled,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(horizontal: 15),
        suffixIcon: widget.obscureText == true
            ? InkWell(
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: Icon(
                  _passwordVisible ? Icons.visibility_off : Icons.visibility_sharp,
                  color: kMainAccentColor,
                  size: 20,
                ),
              )
            : SizedBox(),
        border: InputBorder.none,
        hintText: widget.hintText,
        errorText: widget.errorText,
        prefixIcon: widget.icon,
        hintStyle: TextStyle(
          color: Colors.white24,
          fontSize: 14.5,
        ),
      ),
    );
  }
}
