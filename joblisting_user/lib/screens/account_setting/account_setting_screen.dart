import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joblisting_user/screens/account_setting/account_screen.dart';
import 'package:joblisting_user/screens/account_setting/data_privacy_setting.dart';
import 'package:joblisting_user/screens/account_setting/general_prefrence_screen.dart';
import 'package:joblisting_user/screens/account_setting/helper.dart';
import 'package:joblisting_user/screens/account_setting/manage_notification.dart';
import 'package:joblisting_user/screens/auth/signup/select_country.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/widgets/progess_percentage.dart';
import 'package:joblisting_user/widgets/setting_card.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(
            child: Text(
          AppStrings.accountTxt,
          style: const TextStyle(fontWeight: FontWeight.w800),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                profileWithName(screenWidth, screenHeight),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CountrySelectionScreen(
                                isFromAuth: false,
                              )),
                    );
                  },
                  child: profileCompletion(
                    context,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountSetting()),
                    );
                  },
                  child: settingCard(
                    context,
                    AppStrings.accountTxt,
                    AppStrings.accountInfoTxt,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: settingCard(
                    context,
                    AppStrings.profileSetupTxt,
                    AppStrings.mentionCompanyTxt,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GeneralPreference()),
                    );
                  },
                  child: settingCard(
                    context,
                    AppStrings.generalPrefTxt,
                    AppStrings.appPrefThemesTxt,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManageNotificationSetting()),
                    );
                  },
                  child: settingCard(
                    context,
                    AppStrings.notificationManageTxt,
                    AppStrings.chooseNotificationPrefTxt,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataPrivacySetting()),
                    );
                  },
                  child: settingCard(
                    context,
                    AppStrings.dataPrivacyProtTxt,
                    AppStrings.dataPrivacyEnableDisableTxt,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: settingCard(context, AppStrings.helpSupportTxt,
                      AppStrings.customorChatSupportTxt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget profileCompletion(
  BuildContext context,
) {
  return Stack(children: [
    Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: MyColors.lightPurpleButtonColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CircularPercentageIndicator(
              percentage: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.profileCompletionTxt,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    AppStrings.detailRemainingTxt,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    AppStrings.updatedDayTxt,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    Positioned(top: 20, right: 20, child: SvgPicture.asset(Assets.navArrowIc))
  ]);
}
