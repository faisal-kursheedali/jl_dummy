
import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? padding;
  final EdgeInsets? paddingEdge;
  final double? height;
  final double? width;
  final double? borderWidth;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? shadowColor;
  final double? elevation;
  final bool isBorderSide;

  const CustomContainer(
      {super.key, @required this.child,
        this.onTap,
        this.height,
        this.width,
        this.margin,
        this.borderColor,
        this.shadowColor,
        this.padding = 0,
        this.paddingEdge,
        this.borderRadius = 5,
        this.backgroundColor = Colors.white,
        this.elevation = 0,
        this.borderWidth = 1,
        this.isBorderSide = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: isBorderSide
            ? Border(
          top: BorderSide(width: borderWidth!, color: borderColor!),
        )
            : RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: borderWidth!)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        color: backgroundColor,
        elevation: elevation,
        margin: margin,
        shadowColor: shadowColor ?? Colors.grey,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Padding(
            padding: paddingEdge == null
                ? EdgeInsets.all(padding!)
                : paddingEdge!,
            child: child,
          ),
        ),
      ),
    );
  }
}
