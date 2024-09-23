// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class CustomTextField1 extends StatefulWidget {
  final IconData? leadingIcon;
  final String hintText;
  final String? value;
  final String icon;
  final TextEditingController? controller;

  const CustomTextField1(
      {super.key,
      this.leadingIcon,
      required this.hintText,
      this.value,
      this.controller,
      required this.icon});

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 90,
        decoration: BoxDecoration(
          color: _isFocused ? MyColors.lightPurpleButtonColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade500, width: 1),
        ),
        child: Center(
          child: TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.03,
                ),
                child: widget.icon.endsWith("png") ||
                        widget.icon.endsWith("jpg") ||
                        widget.icon.endsWith("jpeg")
                    ? Image.asset(widget.icon)
                    : SvgPicture.asset(widget.icon),
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: widget.value ?? widget.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            controller:
                //widget.controller,
                TextEditingController(text: widget.value),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class DeatilsTextField extends StatefulWidget {
  final String hintText;
  final String? value;
  final int fsize;
  final color;
  final textColor;
  TextEditingController? controller;

  DeatilsTextField({
    super.key,
    required this.hintText,
    this.value,
    required this.fsize,
    this.color,
    this.controller,
    this.textColor,
  });

  @override
  _DetailsTextFieldState createState() => _DetailsTextFieldState();
}

class _DetailsTextFieldState extends State<DeatilsTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //  height: MediaQuery.of(context).size.height * .050,
        decoration: BoxDecoration(
          color: _isFocused ? MyColors.lightPurpleButtonColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: widget.color, width: 1),
        ),
        child: Center(
          child: TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: widget.textColor,
              ),
              hintText: widget.value ?? widget.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            controller:
                //widget.controller,
                TextEditingController(text: widget.value),
            style: TextStyle(fontSize: widget.fsize.toDouble()),
          ),
        ),
      ),
    );
  }
}
