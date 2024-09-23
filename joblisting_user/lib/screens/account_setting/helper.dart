import 'package:flutter/material.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

Widget profileWithName(double screenWidth, double screenHeight) {
  return Column(
    children: [
      CircleAvatar(
        radius: screenWidth * 0.15,
        backgroundImage: AssetImage(Assets.profilePic),
      ),
      SizedBox(height: screenHeight * 0.02),
      Text(
        PrefUtil.getString(LocalConfig.isProvider) == 'provider'
            ? AppStrings.companyNameTxt
            : "Name",
        style: TextStyle(
            fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
