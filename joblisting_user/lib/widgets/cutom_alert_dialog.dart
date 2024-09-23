import 'package:flutter/material.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Size? size;
  final String message;
  final List<Widget> actions;
  final bool isDismissible;
  final VoidCallback onTap;
  final String? buttonText;
  const CustomAlertDialog(
      {super.key,
      this.size,
      required this.onTap,
      required this.title,
      required this.message,
      required this.actions,
      this.buttonText,
      this.isDismissible = true});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size!.height / 10,
            width: size!.height / 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.greyDivider.withOpacity(0.4)),
            child: Icon(
              weight: 40,
              Icons.check,
              size: 48,
              color: MyColors.purpleButtonColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          // CustomButton(
          //   buttonText: 'Go to Home',
          //   size: size,
          //   ontap: onTap,
          //   width: screenWidth,
          // )
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightPurple,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: Text(
              buttonText.toString().isNotEmpty ||
                      buttonText.toString() != "null"
                  ? buttonText.toString()
                  : AppStrings.goToHomeTxt,
              style: TextStyle(color: MyColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
