import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/screens/account_setting/job_alert_setting.dart';
import 'package:joblisting_user/screens/account_setting/network_connection_setting.dart';
import 'package:joblisting_user/screens/language_select_screen.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:joblisting_user/widgets/setting_card.dart';
import 'package:provider/provider.dart';

class GeneralPreference extends StatefulWidget {
  const GeneralPreference({super.key});

  @override
  State<GeneralPreference> createState() => _GeneralPreferenceState();
}

class _GeneralPreferenceState extends State<GeneralPreference> {
  Map<String, bool> expandedItems = {
    AppStrings.autoplayVideos: false,
    AppStrings.showProfilePicture: false,
  };
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.sizeOf(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print("jhj:${authProvider.authUserType}");
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(
            child: Text(
          AppStrings.generalPrefTxt,
          style: const TextStyle(fontWeight: FontWeight.w800),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: authProvider.authUserType == AuthUserType.seeker
            ? Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LanguageSelectionScreen()),
                      );
                    },
                    child: settingCard(
                      context,
                      AppStrings.languageTxt,
                      AppStrings.englishTxt,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: expandedItems.keys.map((item) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          margin: const EdgeInsets.only(
                              left: 13.0, bottom: 13, top: 13),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ExpansionTile(
                              trailing: SvgPicture.asset(Assets.roundArrowIc),
                              collapsedBackgroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(
                                    right: screenWidth * 0.2,
                                    top: screenWidth * 0.01),
                                child: Text(
                                  item == AppStrings.autoplayVideos
                                      ? "When connected to Wi-Fi"
                                      : "Only to My Network",
                                  softWrap: true,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              title: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              initiallyExpanded: expandedItems[item]!,
                              onExpansionChanged: (bool isExpanded) {
                                setState(() {
                                  expandedItems[item] = isExpanded;
                                });
                              },
                              children: [
                                _buildExpansionContent(item),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LanguageSelectionScreen()),
                        );
                      },
                      child: settingCard(
                        context,
                        AppStrings.languageTxt,
                        AppStrings.englishTxt,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JobAlertSetting()),
                        );
                      },
                      child: settingCard(
                        context,
                        AppStrings.candidateAlertTxt,
                        AppStrings.candidateAlertRecommandationTxt,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NetWorkConnectionSetting()),
                        );
                      },
                      child: settingCard(
                        context,
                        AppStrings.newAndEventsTxt,
                        AppStrings.publishingNewTxt,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.26),
                    CustomButton(
                      buttonText: AppStrings.saveBtn,
                      size: size,
                      width: UiUtils.longButtonWidth - 3,
                      ontap: () {},
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildExpansionContent(String title) {
    if (title == AppStrings.autoplayVideos) {
      const SizedBox(height: 8);
      return const AutoplayVideoComp();
    } else if (title == AppStrings.showProfilePicture) {
      const SizedBox(height: 8);
      return const ShowProfilePictureComp();
    } else {
      return Container();
    }
  }
}

class AutoplayVideoComp extends StatefulWidget {
  const AutoplayVideoComp({super.key});

  @override
  State<AutoplayVideoComp> createState() => _AutoplayVideoCompState();
}

class _AutoplayVideoCompState extends State<AutoplayVideoComp> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCheckBoxListTile('When connected to Wi-Fi'),
        _buildCheckBoxListTile('Using Mobile Data'),
        _buildCheckBoxListTile('None'),
      ],
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: selectedItem == title,
        onChanged: (bool? value) {
          setState(() {
            selectedItem = value == true ? title : null;
          });
        },
      ),
    );
  }
}

class ShowProfilePictureComp extends StatefulWidget {
  const ShowProfilePictureComp({super.key});

  @override
  State<ShowProfilePictureComp> createState() => _ShowProfilePictureCompState();
}

class _ShowProfilePictureCompState extends State<ShowProfilePictureComp> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCheckBoxListTile('Only to My Network'),
        _buildCheckBoxListTile('Only to app users'),
        _buildCheckBoxListTile('Anyone '),
        _buildCheckBoxListTile('None'),
      ],
    );
  }

  Widget _buildCheckBoxListTile(String title) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: selectedItem == title,
        onChanged: (bool? value) {
          setState(() {
            selectedItem = value == true ? title : null;
          });
        },
      ),
    );
  }
}
