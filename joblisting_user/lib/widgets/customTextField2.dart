

import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/custom_container.dart';


// ignore: must_be_immutable
class CustomTextField2 extends StatefulWidget {
  final bool autoFocus;
  final String labelText;
  final void Function(String) onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final VoidCallback? trailingFunction;
  final String? defaultValue;
  final bool showTrailingWidget;
  final Widget? trailing;
  final bool showLeadingWidget;
  final Widget? leading;
  final bool autofocus;
  final bool isEnabled;
  final bool isLabelEnabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPasswordField;
  Color? borderColor;
  Color? focusedBorderColor;
  final double borderWidth;
  final double focusedBorderWidth;
  final double borderRadius;
  final String? hintText;
  final bool overrideHintText;
  final bool isFilled;
  final Color? fillColor;
  final double? width;
  final EdgeInsets? margin;
  final FocusNode? focusNode;
  final EdgeInsets contentPadding;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final double? elevation;
  final bool? isSimpleBorder;
  final int? maxLength;
  final String? counterText;


  CustomTextField2(
      {super.key, required this.labelText,
        required this.onChanged,
        this.onFieldSubmitted,
        this.onTap,
        this.hintText,
        this.trailingFunction,
        this.defaultValue,
        this.keyboardType,
        this.controller,
        this.validator,
        this.trailing,
        this.width,
        this.margin,
        this.overrideHintText = false,
        this.showTrailingWidget = true,
        this.autofocus = false,
        this.isPasswordField = false,
        this.borderColor,
        this.focusedBorderColor,
        this.borderWidth = 1,
        this.focusedBorderWidth = 2,
        this.borderRadius = 20,
        this.elevation = 2,
        this.autoFocus = true,
        this.isSimpleBorder = false,
        this.labelStyle,
        this.contentPadding = const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        this.fillColor = Colors.white,
        this.isFilled = false,
        this.hintTextStyle,
        this.textStyle,
        this.isEnabled = true,
        this.isLabelEnabled = true,
        this.showLeadingWidget = false,
        this.maxLength,
        this.counterText,
        this.focusNode,
        this.leading});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<CustomTextField2> {
  late bool _showPassword;

  @override
  void initState() {
    _showPassword = !widget.isPasswordField;
    super.initState();
  }

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.borderColor ??= Colors.grey;
    widget.focusedBorderColor ??= Colors.grey;
    return CustomContainer(
      width: widget.width,
      padding: 0,
      margin: widget.margin,
      shadowColor: widget.borderColor,
      elevation: widget.elevation,
      borderColor: widget.isSimpleBorder! ? null : widget.borderColor,
      borderWidth: widget.borderWidth,
      borderRadius: widget.borderRadius,
      backgroundColor: Colors.transparent,
      child: TextFormField(
        maxLength:widget.maxLength,
        showCursor: true,

        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        controller: widget.controller,
        validator: widget.validator,
        initialValue: widget.defaultValue,
        textAlignVertical: TextAlignVertical.center,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        enabled: widget.isEnabled,
        obscureText: widget.isPasswordField ? !_showPassword : false,
        style: widget.textStyle ?? TextStyle(color: MyColors.black),
        cursorColor: MyColors.lightPurpleBgColor,

        decoration: InputDecoration(
          counterText: widget.counterText,
          filled: widget.isFilled,
          fillColor: widget.fillColor,
          floatingLabelBehavior: widget.isLabelEnabled
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          hintText: '',
          labelStyle: widget.labelStyle ?? (widget.textStyle ?? TextStyle(color: MyColors.black)),
          contentPadding: widget.contentPadding,
          prefixIcon: widget.showLeadingWidget ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: widget.showLeadingWidget ? widget.leading : null,
              )

            ],
          ):null,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(this.widget.borderRadius),
          // ),
          border: InputBorder.none,
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor!,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.focusedBorderColor!,
              width: widget.focusedBorderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ).copyWith(
          hintText: widget.overrideHintText
              ? widget.hintText
              : widget.labelText,
          labelText: widget.labelText,
          suffixIcon: widget.showTrailingWidget
              ? widget.trailing == null
              ? Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: widget.isPasswordField
                ? IconButton(
              splashRadius: 1,
              color: MyColors.lightPurpleBgColor,
              icon: _showPassword
                  ? const Icon(Icons.visibility, size: 25.0)
                  : const Icon(Icons.visibility_off, size: 25.0),
              onPressed: toggleShowPassword,
            )
                : null,
          )
              : GestureDetector(
              onTap: widget.trailingFunction,
              child: widget.trailing)
              : null,
        ),
      ),
    );
  }
}