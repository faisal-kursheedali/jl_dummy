import 'package:flutter/material.dart';
import 'package:joblisting_user/screens/account_setting/setting_expanded_widget.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
// import 'package:joblisting_user/widgets/button.dart';

class DataPrivacySetting extends StatefulWidget {
  const DataPrivacySetting({super.key});

  @override
  State<DataPrivacySetting> createState() => _DataPrivacySettingState();
}

class _DataPrivacySettingState extends State<DataPrivacySetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(child: Text(AppStrings.dataPrivacyTxt, style: const TextStyle(fontWeight: FontWeight.w800),)),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
             const SettingExpndedCard(subtext:'', text:  'Show Account Detail',),
              SizedBox(height: screenHeight * 0.60),
              CustomButton(
                buttonText: AppStrings.saveBtn,
                ontap: () {},
                size: size,
                width: UiUtils.longButtonWidth - 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
