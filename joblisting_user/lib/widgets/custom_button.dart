import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.size,
    required this.ontap,
    required this.width,
    this.isTransparentButton = false,
  });

  final Size size;
  final String buttonText;
  final VoidCallback ontap;
  final double width;
  final bool isTransparentButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: MyColors.purpleButtonColor),
        backgroundColor: isTransparentButton == true
            ? MyColors.white
            : MyColors.purpleButtonColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width / width,
          vertical: 16,
        ),
        textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isTransparentButton == true
                ? MyColors.purpleButtonColor
                : MyColors.white),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isTransparentButton == true
                ? MyColors.purpleButtonColor
                : MyColors.white),
      ),
    );
  }
}
