
import 'package:flutter/material.dart';
import 'package:joblisting_user/screens/account_setting/job_alert_setting.dart';
import 'package:joblisting_user/screens/account_setting/network_connection_setting.dart';
import 'package:joblisting_user/screens/account_setting/setting_expanded_widget.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:joblisting_user/widgets/setting_card.dart';
// import 'package:joblisting_user/widgets/button.dart';

class ManageNotificationSetting extends StatefulWidget {
  const ManageNotificationSetting({super.key});

  @override
  State<ManageNotificationSetting> createState() => _ManageNotificationSettingState();
}

class _ManageNotificationSettingState extends State<ManageNotificationSetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(child: Text('Manage Notification', style: const TextStyle(fontWeight: FontWeight.w700),)),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
               InkWell(
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JobAlertSetting()),
                    );
                  },
                  child: settingCard(
                    context,
                    'Job Alert',
                    'Job alerts, Job recommendation, Job application updates',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NetWorkConnectionSetting()),
                    );
                  },
                  child: settingCard(
                    context,
                'Network Connection',
                    'People Request, Group Invites, Subscription',
                  ),
                ),
                   InkWell(
                  onTap: () {
                  
                  },
                  child: settingCard(
                    context,
                    'News & Events',
                    'Publishing News Articles, Other Events',
                  ),
                ),
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
